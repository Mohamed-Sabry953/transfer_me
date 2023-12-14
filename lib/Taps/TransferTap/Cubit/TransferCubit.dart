import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfer_me/HomeLayout/HomeLayout.dart';
import 'package:transfer_me/Taps/TransferTap/Cubit/TransferStates.dart';
import 'package:transfer_me/models/UserModel.dart';

class TransferCubit extends Cubit<TransferStates>{
  TransferCubit():super(TransferInitState());
  static TransferCubit get(context)=>BlocProvider.of(context);
  CollectionReference payments = FirebaseFirestore.instance.collection("PaymentMethod");
  int amountVal=0;
  List<UserModel>users=[];
  UserModel userModel=UserModel(accountNo: 0, Email: "Email");
  String name="";
  bool check=false;
  int newCardBal=0;
  String? validateAccNo(String? value) {
    if (value != null) {
      if (value.length >= 7 ) {
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
          users.add(UserModel(accountNo: doc["accountNo"], Email: doc["Email"],firstname: doc["firstname"],
              lastname:doc["lastname"]));
      }
      emit(SucGetDataState());
    });
  }
  checkAccNo(String accNo){
    for(int i=0; i<users.length;i++){
      emit(TransferLoadingState());
      if(users[i].accountNo.toString()==accNo){
        name="${users[i].firstname} ${users[i].lastname}";
        check=true;
        emit(SucCheckAccNoState());
        return;
      }
      check=false;
      name="";
      emit(ErrorCheckAccNoState());
    }
  }
  updatePaymentBal(String docId,BuildContext context){
    emit(TransferLoadingState());
    return payments.doc(docId).update(
        {"cardBalance":newCardBal,
        }).then((value) {
      emit(TransferSucState());
      Future.delayed(Duration(seconds: 5),() {
        Navigator.pushNamed(context, HomeLayout.routeName);
      },);
    },);
  }
}