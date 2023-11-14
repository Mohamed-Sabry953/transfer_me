import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:transfer_me/HomeLayout/HomeLayout.dart';
import 'package:transfer_me/Login/Cubit/LoginStates.dart';

import '../../models/UserModel.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit():super(initLoginState());
  static LoginCubit get(context)=>BlocProvider.of(context);

  login(String emailAddress,String password,BuildContext context) async {
    emit(LoadingLoginState());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      ).then((credential){
        emit(SuccsesLoginState());
        Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);
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
  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    UserModel user=UserModel(
      firstname: googleUser!.displayName,
      lastname: "",
      phoneNo: 01062832633,
      profileImage: googleUser.photoUrl,
      id: FirebaseAuth.instance.currentUser!.uid,
      accountNo: Random().nextInt(400000000), Email: googleUser.email,);
    var Collection= getUserColletion();
    var docRef=Collection.doc(FirebaseAuth.instance.currentUser!.uid);
    docRef.set(user);
    emit(LoginWithGmailSuccsesState());
    Navigator.pushNamed(context, HomeLayout.routeName,);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}