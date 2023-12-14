import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:transfer_me/HomeLayout/HomeLayout.dart';
import 'package:transfer_me/Login/loginScreen.dart';
import 'package:transfer_me/PinScreen/SetpinScreen_Login.dart';
import 'package:transfer_me/Taps/ProfileTap/Cubit/ProfileStates.dart';
import 'package:transfer_me/Taps/ProfileTap/SetProfile/phoneNoScreen.dart';
import 'package:transfer_me/Taps/ProfileTap/SetProfile/phoneNoVerifyScreen.dart';
import 'package:transfer_me/models/UserModel.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileinitState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  String firstName = '';
  String LastName = '';
  int count=0;
  File? userImgFile;
  String? userImgFileUrl;
  UserModel userModel = UserModel(accountNo: 0, Email: "");
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  User? firebaseuser = FirebaseAuth.instance.currentUser;
  setProfileNameValidation(String text) {
    firstName = text;
    if (firstName.length >= 4) {
      emit(SetProfileNameSuccsesValidationState());
      return null;
    }
    emit(SetProfileNameErrorValidationState());
  }

  setProfileLastNameValidation(String text) {
    LastName = text;
    if (LastName.length >= 4) {
      emit(SetProfileLastNameSuccsesValidationState());
      return null;
    }
    emit(SetProfileNameErrorValidationState());
  }

  void pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      userImgFile = File(image.path);
      emit(SetProfilePictureSuccsesUploadState());
    }
    emit(SetProfilePictureErrorUploadState());
  }

  Future<String> imageToFirebaseStorage() async {
    Reference imageRef =
    FirebaseStorage.instance.ref(basename(userImgFile!.path));
    await imageRef.putFile(userImgFile!);
    emit(SetProfilePictureSuccsesUploadToFirebaseState());
    return await imageRef.getDownloadURL();
  }
  UpdateUserFirebaseData(String firstname,String lastname,BuildContext context) async {
    emit(ProfileLoadingState());
    userImgFileUrl= await imageToFirebaseStorage();
    return users.doc(FirebaseAuth.instance.currentUser!.uid).update(
        {"firstname": firstname,
        "lastname": lastname,
        "profileImage": userImgFileUrl
        }).then((value) {
          emit(SetProfileLastNameSuccsesValidationState());
          Navigator.pushNamedAndRemoveUntil(context, phoneNoScreen.routeName, (route) => false);
        },).catchError((e){
          print(e.toString());
    });
  }
  UpdateUserPhoneNoFirebaseData(int No,BuildContext context){
    emit(ProfileLoadingState());
    imageToFirebaseStorage();
    return users.doc(FirebaseAuth.instance.currentUser!.uid).update(
        {"phoneNo": No,
        }).then((value) {
          emit(SetProfileLastNameSuccsesValidationState());
          Navigator.pushNamed(context, phoneNoVerifyScreen.routeName);
        },);
  }
  getProfileDataFromFirebase() {
    emit(SetProfileGetDataFromFirebaseLoadingState());
     FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        UserModel profile = UserModel(profileImage: documentSnapshot.get('profileImage'),
            firstname: documentSnapshot.get('firstname'),
            lastname: documentSnapshot.get('lastname'),
            accountNo: documentSnapshot.get('accountNo'),
            Email: documentSnapshot.get('Email'),
            id: documentSnapshot.get('id'),
        phoneNo: documentSnapshot.get('phoneNo'));
        userModel = profile;
        emit(SetProfileGetDataFromFirebaseSuccsesState());
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  phoneNoVerify(BuildContext context,String phoneNo)async{
    try {
      emit(ProfileLoadingState());
      FirebaseAuth auth = FirebaseAuth.instance;
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: "+201062832633",
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
            emit(SetProfilePictureSuccsesUploadState());
          },
          verificationFailed: (FirebaseAuthException e) {
            if (e.code == 'invalid-phone-number') {
              print('The provided phone number is not valid.');
              emit(SetProfileNoVerifyErrorState());
            }
          },
          codeSent: (String verificationId, int? resendToken) async {
            String smsCode = phoneNo;
            emit(ProfileLoadingState());
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: smsCode);
            await auth.signInWithCredential(credential);
            emit(SetProfileNoVerifySuccsesState());
            Navigator.pushNamedAndRemoveUntil(context, SetPin_Login.routeName, (route) => false);
          },
          timeout: const Duration(seconds: 60),
          codeAutoRetrievalTimeout: (String verificationId) {},
    );}catch (error){
      print(error.toString());
      emit(SetProfileNoVerifyErrorState());
    }
  }
  Logout(BuildContext context){
    return FirebaseAuth.instance.signOut().then((value) => Navigator.pushNamedAndRemoveUntil(context, loginScreen.routeName, (route) => false));
  }
  autoLogin() {
    firebaseuser = null;
    emit(AutoLoginSucssesState());
  }
  fingerPrint(int num){
    count=count+num;
    emit(SetProfileGetDataFromFirebaseSuccsesState());
  }

  updatePicUserFirebaseData(BuildContext context) async {
    emit(ProfileLoadingState());
    userImgFileUrl= await imageToFirebaseStorage();
    return users.doc(FirebaseAuth.instance.currentUser!.uid).update(
        {
          "profileImage": userImgFileUrl
        }).then((value) {
      Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);
      emit(SetProfileLastNameSuccsesValidationState());
    },).catchError((e){
      print(e.toString());
    });
  }
}
