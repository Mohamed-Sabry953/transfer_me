import 'package:transfer_me/signUp/Cubit/SignupStates.dart';

abstract class ProfileStates extends SignupStates{}
class ProfileinitState extends ProfileStates{}
class ProfileLoadingState extends ProfileStates{}
class SetProfilePictureSuccsesUploadState extends ProfileStates{}
class SetProfilePictureSuccsesUploadToFirebaseState extends ProfileStates{}
class SetProfilePictureErrorUploadState extends ProfileStates{}
class SetProfileNameSuccsesValidationState extends ProfileStates{}
class SetProfileNameErrorValidationState extends ProfileStates{}
class SetProfileLastNameSuccsesValidationState extends ProfileStates{}
class SetProfilePhoneNoSuccsesState extends ProfileStates{}
class SetProfileLastNameErrorValidationState extends ProfileStates{}
class SetProfileGetDataFromFirebaseSuccsesState extends ProfileStates{}
class SetProfileGetDataFromFirebaseLoadingState extends ProfileStates{}
class SetProfileNoVerifySuccsesState extends ProfileStates{}
class SetProfilePinSuccsesState extends ProfileStates{}
class SetProfileNoVerifyErrorState extends ProfileStates{}
class AutoLoginSucssesState extends ProfileStates{}
class PrintFingerSucssesState extends ProfileStates{}