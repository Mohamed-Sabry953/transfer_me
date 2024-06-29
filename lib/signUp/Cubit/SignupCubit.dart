import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfer_me/PinScreen/SetPinScreen.dart';
import 'package:transfer_me/models/UserModel.dart';
import 'package:transfer_me/signUp/Cubit/SignupStates.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupCubit extends Cubit<SignupStates> {

  SignupCubit() :super(SignupinitState());

  static SignupCubit get(context) => BlocProvider.of(context);
  bool visble = false;
  String pass = '';
  String? user;
  String? id;

  String? validateEmail(String? value) {
    if (value != null) {
      if (value.length > 5 &&
          value.contains('@') &&
          value.endsWith('gmail.com')) {
        emit(SignupVaildatorEmailSuccsesState());
        return null;
      }
      emit(SignupVaildatorEmailErrorState());
      return 'Enter a Valid Email Address';
    }
  }

  String? validatePassword(String? value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
    if (value!.isEmpty) {
      emit(SignupVaildatorPasswordErrorState());
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        emit(SignupVaildatorPasswordErrorState());
        return 'Enter valid password';
      } else {
        emit(SignupVaildatorPasswordSuccsesState());
        return null;
      }
    }
  }

  visablePass() {
    if (visble == false) {
      visble = true;
      emit(VisablityState());
    }
    else {
      visble = false;
      emit(UnvisablityState());
    }
  }

  String? validateConfirmPassword(String? value) {
    emit(SignupVaildatorRePasswordLoadingState());
    if (value!.isEmpty) return 'Empty';
    if (value != pass) {
      emit(SignupVaildatorRePasswordErrorState());
      return 'Not Match';
    }
    emit(SignupVaildatorRePasswordSuccsesState());
    return null;
  }

  String? validateMobile(String? value) {
// Indian Mobile number are of 10 digit only
    if (value!.length != 11) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
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
  singup(String Email,String password,Function Nav)async{
      {
        emit(SignupLoadingState());
        FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: Email,
          password: password,
        ).then((userCredential) {
          UserModel user=UserModel(
              id: userCredential.user!.uid,
              accountNo: Random().nextInt(400000000), Email: Email);
          var Collection= getUserColletion();
          var docRef=Collection.doc(userCredential.user!.uid);
          docRef.set(user);
          Nav();
          emit(SignupSuccsesState());
        },).catchError((e){
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
          }
          emit(SignupErrorState(e.toString()));
        });
      }
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
    emit(SignupWithGmailSuccsesState());
    Navigator.pushNamed(context, SetPin.routeName,);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}