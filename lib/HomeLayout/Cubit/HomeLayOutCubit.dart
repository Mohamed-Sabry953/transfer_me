import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutStates.dart';
import 'package:transfer_me/Taps/MyWalletTap/MyWallet.dart';
import 'package:transfer_me/Taps/ProfileTap/ProfileTap.dart';
import 'package:transfer_me/Taps/TransferTap/TransferTap.dart';
import 'package:transfer_me/models/PaymentMethodModel.dart';
import 'package:transfer_me/models/transactiosModel.dart';

import '../../models/UserModel.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutinit());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);
  List<Color> cardColor = [
    const Color(0xFF8CD9E9),
    const Color(0xFF34A853),
    const Color(0xFF0166FF),
    const Color(0xFFF59D31),
    const Color(0xFFFC6020),
    const Color(0xFF009CDE),
    const Color(0xFFE80B26),
    const Color(0xFFFBBC05),
    const Color(0xFF979797),
    const Color(0xFF392993),
    const Color(0xFF003087),
    const Color(0xFF001A4C),
    const Color(0xFF1E1E1E),
  ];
  int Currentindex = 0;
  int Balance = 0;
  int colorIndex = 0;
  int selectCardIndex = 0;
  int onBoardingIndex=0;
  bool activeValidation = false;
  UserModel userModel = UserModel(accountNo: 0, Email: "");
  List<PaymentMethodModel> cards = [];
  List<TransactionModel>inComing=[];
  List<TransactionModel>outgoing=[];

  void changeIndex(int index, BuildContext context) {
    Currentindex = index;
    if (Currentindex == 3) {
      Navigator.pushNamed(context, ProfileTap.routeName);
      Currentindex = 0;
    } else if (Currentindex == 1) {
      Navigator.pushNamed(context, MyWalletTap.routeName);
      Currentindex = 0;
    }
    else if (Currentindex == 2) {
      Navigator.pushNamed(context, TransferTap.routeName);
      Currentindex = 0;
    }

    emit(ChangeIndexStates());
  }

  getProfileDataFromFirebase() {
    emit(SetProfileGetDataFromFirebaseLoadingState());
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        UserModel profile = UserModel(
            profileImage: documentSnapshot.get('profileImage'),
            firstname: documentSnapshot.get('firstname'),
            lastname: documentSnapshot.get('lastname'),
            accountNo: documentSnapshot.get('accountNo'),
            Email: documentSnapshot.get('Email'),
            id: documentSnapshot.get('id'),
            phoneNo: documentSnapshot.get('phoneNo'));
        userModel = profile;
        emit(ProfileGetDataFromFirebaseSuccsesState());
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  CollectionReference<PaymentMethodModel> getPaymentMethodCollection() {
    return FirebaseFirestore.instance.collection("PaymentMethod").withConverter(
      fromFirestore: (snapshot, options) {
        return PaymentMethodModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.Tojson();
      },
    );
  }

  AddPaymentMethodTofirebase(int CardNumber, String HolderName,
      String ExpireDate, int CVV) {
    PaymentMethodModel paymentMethodModel = PaymentMethodModel(
        CardNumber: CardNumber.toString(),
        HolderName: HolderName,
        ExpireDate: ExpireDate,
        CVV: CVV,
        color: 0,
        id: FirebaseAuth.instance.currentUser!.uid,
        cardBalance: Random().nextInt(10000));
    var Collection = getPaymentMethodCollection();
    var docRef =
    Collection.doc("${FirebaseAuth.instance.currentUser!.uid}$CardNumber");
    docRef.set(paymentMethodModel);
  }

  changeColorOfCard(int currentIndex) {
    colorIndex = currentIndex;
    emit(ChangeIndexStates());
  }

  setCardColor(String cardNo, int index, BuildContext context, String email,
      String image, String firstName, String lastName) {
    return getPaymentMethodCollection()
        .doc("${FirebaseAuth.instance.currentUser!.uid}$cardNo")
        .update({"color": index}).then((value) {
      emit(SetColorSucssesState());
      Navigator.pushNamedAndRemoveUntil(
          context, MyWalletTap.routeName, (route) => false,
          arguments: UserModel(
              accountNo: 0,
              Email: email,
              profileImage: image,
              firstname: firstName,
              lastname: lastName));
    }).catchError((e) {
      emit(SetColorErrorState());
      print(e.toString());
    });
  }

  getCardDataFromFirebase() {
    List<PaymentMethodModel>CardImedate = [];
    emit(CardsGetDataFromFirebaseLoadingState());
    emit(AddBalanceLoadingState());
    getPaymentMethodCollection().get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        getPaymentMethodCollection().get().then((value) {
          PaymentMethodModel paymentMethodModel = PaymentMethodModel(
              CardNumber: doc.get("CardNumber"),
              HolderName: doc.get("HolderName"),
              ExpireDate: doc.get("ExpireDate"),
              CVV: doc.get("CVV"),
              id: doc.get("id"),
              cardBalance: doc.get("cardBalance"),
              color: doc.get("color"));
          emit(CardsGetDataFromFirebaseSucssesState());
          if (paymentMethodModel.id == FirebaseAuth.instance.currentUser!.uid) {
            CardImedate.add(paymentMethodModel);
            Balance += paymentMethodModel.cardBalance!;
          }
          cards = CardImedate;
        });
      }
    });
  }

  selectCard(int index) {
    selectCardIndex = index;
    emit(SelectCardIndexSuccsesState());
  }

  String? validateAmount(String? value) {
    if (value != 0.toString()) {
      if (int.parse(value!) >=
          int.parse(cards[selectCardIndex].cardBalance.toString())) {
        emit(BalanceCheckValidatorErrorState());
        return 'The value is very high';
      }
      else if (int.parse(value) <=
          int.parse(cards[selectCardIndex].cardBalance.toString()) &&
          int.parse(value) < 10) {
        return "The amount can be at least 10\$ ";
      }
    }
    else if (value == 0.toString()) {
      emit(BalanceCheckValidatorErrorState());
      return "The amount can be at least 10\$ ";
    }
    emit(BalanceCheckValidatorSucState());
    return null;
  }

  getTransactionsData() {
    emit(GetTransactionsLoadingState());
    FirebaseFirestore.instance
        .collection("Transaction")
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        TransactionModel transactionModel = TransactionModel(
            receiveImg: doc['receiveImg'],
            senderImg: doc['senderImg'],
            amountTransfer: doc['amountTransfer'],
            senderName: doc['senderName'],
            receiverName: doc['receiverName'],
            senderAccNo: doc['senderAccNo'],
            receiverAccNo: doc['receiverAccNo'],
            id: doc['id']);
        if(userModel.accountNo==transactionModel.receiverAccNo){
          inComing.add(transactionModel);
        }
        else if(transactionModel.senderAccNo==userModel.accountNo){
          outgoing.add(transactionModel);
        }
      }
        emit(GetTransactionsSucState());
    });
  }
  changeIndexOnboarding(int index){
    onBoardingIndex=index;
    emit(ChangeOnboardingIndexSucState());
  }
}
