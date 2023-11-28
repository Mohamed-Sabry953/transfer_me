import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:transfer_me/HomeLayout/HomeLayout.dart';
import 'package:transfer_me/Login/loginScreen.dart';
import 'package:transfer_me/PinScreen/Cubit/PinStates.dart';
import 'package:transfer_me/signUp/SuccsesSignupScreen.dart';
import '../../models/UserModel.dart';

class PinCubit extends Cubit<PinStates> {
  PinCubit() : super(PininitState());

  static PinCubit get(context) => BlocProvider.of(context);
  List<String> pinNum = [];
  String pinContent = '';
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  UserModel userModel = UserModel(accountNo: 0, Email: "");

  buttonPinSet(String pinNumChar) {
    if (pinNum.length < 5) {
      pinNum.add(pinNumChar);
      pinContent += pinNumChar;
    emit(SucToAddCharToPinList());
    }
  }

  buttonPinDelete() {
    pinNum.removeRange(0, pinNum.length);
    pinContent = '';
    emit(SucToDelFromPinList());
  }

  CollectionReference<UserModel> getUserColletion() {
    return FirebaseFirestore.instance.collection('Users').withConverter(
      fromFirestore: (snapshot, _) {
        return UserModel.fromjson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.Tojson();
      },
    );
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    if (pinNum.length == 5) {
      UserModel user = UserModel(
          firstname: googleUser!.displayName,
          lastname: "",
          phoneNo: 01062832633,
          profileImage: googleUser.photoUrl,
          id: FirebaseAuth.instance.currentUser!.uid,
          accountNo: Random().nextInt(400000000),
          Email: googleUser.email,
          pin: pinContent);
      var Collection = getUserColletion();
      var docRef = Collection.doc(FirebaseAuth.instance.currentUser!.uid);
      docRef.set(user);
    }
    Navigator.pushNamedAndRemoveUntil(
        context, SuccsesSignupScreen.routeName, (route) => false);
    emit(LoginWithGmailSuccsesState());
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  updateUserPinFirebaseData(BuildContext context) {
    emit(PinLoadingState());
    if (pinNum.length == 5) {
      Navigator.pushNamedAndRemoveUntil(
          context, loginScreen.routeName, (route) => false,
          arguments: pinContent);
      emit(SucSetUserPinToFirebaseData());
    }
  }

  getPinFromFirebase() {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        UserModel profile = UserModel(
            accountNo: documentSnapshot.get('accountNo'),
            Email: documentSnapshot.get('Email'),
            id: documentSnapshot.get('id'),
            pin: documentSnapshot.get('pin'));
        userModel = profile;
        emit(PinGetDataFromFirebaseSucState());
      } else {
        print('Document does not exist on the database');
      }
    });
  }
  unLockPin(BuildContext context){
    if(userModel.pin==pinContent&&pinNum.length==5){
      Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);
      emit(SucToUnlockState());
    }
    else{
      emit(ErrorToUnlockState());
      pinNum.removeRange(0, pinNum.length);
      pinContent="";
      emit(SucToDelValOfPin());
    }
  }
}
