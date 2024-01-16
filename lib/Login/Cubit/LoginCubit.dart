import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:transfer_me/HomeLayout/HomeLayout.dart';
import 'package:transfer_me/HomeLayout/onBoardingScreens/onBoarding.dart';
import 'package:transfer_me/Login/Cubit/LoginStates.dart';
import 'package:transfer_me/signUp/signup.dart';

import '../../models/UserModel.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit():super(initLoginState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  bool? secondLog;
  List<UserModel>accounts=[];
  login(String pinContent,String emailAddress,String password,BuildContext context) async {
    emit(LoadingLoginState());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      ).then((credential){
        emit(SuccsesLoginState());
        if(pinContent.length!=5){
          Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);
          return users.doc(FirebaseAuth.instance.currentUser!.uid).update(
              {
                "secondLog":true,
              });
        }
        else{
        Navigator.pushNamedAndRemoveUntil(context, OnBoardingScreen.routeName, (route) => false);
          return users.doc(FirebaseAuth.instance.currentUser!.uid).update(
              {"pin": pinContent,
              });
        }
      }).catchError((e){
        emit(ErrorLoginState());
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      });
  }
  CollectionReference<UserModel> getUserColletion() {
    return FirebaseFirestore.instance.collection('Users').withConverter(
      fromFirestore: (snapshot, _) {
        return UserModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.Tojson();
      },);
  }

  getProfileDataFromFirebase() {
    emit(LoadingLoginState());
    FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        accounts.add(UserModel(accountNo: doc["accountNo"],
            Email: doc["Email"],
            firstname: doc["firstname"],
            lastname: doc["lastname"],
            profileImage: doc["profileImage"]));
      }
    });}
  signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request

    for(int i=0;i<accounts.length;i++){
      if(googleUser?.email==accounts[i].Email){
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        return await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
          Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);
          return value;
        });
      }
      GoogleSignIn().signOut().then((value) {
        Navigator.pushNamed(context, signup.routeName);
      },);
    }
     }
}