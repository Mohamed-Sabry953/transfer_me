import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfer_me/HomeLayout/HomeLayout.dart';
import 'package:transfer_me/Taps/TransferTap/Cubit/TransferStates.dart';
import 'package:transfer_me/models/UserModel.dart';
import 'package:transfer_me/models/transactiosModel.dart';

class TransferCubit extends Cubit<TransferStates> {
  TransferCubit() :super(TransferInitState());

  static TransferCubit get(context) => BlocProvider.of(context);
  CollectionReference payments = FirebaseFirestore.instance.collection(
      "PaymentMethod");
  int amountVal = 0;
  List<UserModel>users = [];
  UserModel userModel = UserModel(accountNo: 0, Email: "Email");
  UserModel userTwo=UserModel(accountNo: 0, Email: "Email");
  String name = "";
  bool check = false;
  int newCardBal = 0;

  String? validateAccNo(String? value) {
    if (value != null) {
      if (value.length >= 7&&int.parse(value)==userTwo.accountNo) {
        emit(AccNoValidatorSucState());
        return null;
      }
      emit(AccNoValidatorErrorState());
      return 'Enter a Valid account Number';
    }
    emit(AccNoValidatorErrorState());
    return null;
  }

  getProfileDataFromFirebase() {
    emit(TransferLoadingState());
    FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        users.add(UserModel(accountNo: doc["accountNo"],
            Email: doc["Email"],
            firstname: doc["firstname"],
            lastname: doc["lastname"],
        profileImage: doc["profileImage"]));
      }
    });
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
        print(userModel.Email);
        emit(SucGetDataState());
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  checkAccNo(String accNo) {
    for (int i = 0; i < users.length; i++) {
      if (users[i].accountNo.toString() == accNo) {
        name = "${users[i].firstname} ${users[i].lastname}";
        check = true;
        userTwo=users[i];
        emit(SucCheckAccNoState());
        return;
      }
      check = false;
      name = "";
      emit(ErrorCheckAccNoState());
    }
  }

  CollectionReference<TransactionModel> getTransactionCollection() {
    return FirebaseFirestore.instance.collection("Transaction").withConverter(
      fromFirestore: (snapshot, options) {
        return TransactionModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.Tojson();
      },
    );
  }

  addTransactionOperateToFirebase(
      String amountTransfer,String docId,BuildContext context) {
    emit(TransferLoadingState());
    TransactionModel transactionModel = TransactionModel(
        receiveImg: userTwo.profileImage!,
        senderImg: userModel.profileImage!,
        amountTransfer: amountTransfer,
        senderName: "${userModel.firstname} ${userModel.lastname}",
        receiverName: "${userTwo.firstname} ${userTwo.lastname}",
        senderAccNo: userModel.accountNo,
        receiverAccNo: userTwo.accountNo,
        id: Random().nextInt(400000000).toString());
    var collection = getTransactionCollection();
    var docRef =
    collection.doc("${FirebaseAuth.instance.currentUser!.uid}${Random().nextInt(10000)}");
    docRef.set(transactionModel).then((value) {
      emit(TransAddToFirebaseSucState());
      return payments.doc(docId).update(
          {"cardBalance": newCardBal,
          }).then((value) {
        Navigator.pushNamed(context, HomeLayout.routeName);
        emit(TransferSucState());
      },);
    },);
  }
}