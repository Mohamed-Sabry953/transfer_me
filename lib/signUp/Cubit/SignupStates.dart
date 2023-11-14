abstract class SignupStates{}
class SignupinitState extends SignupStates{}
class SignupVaildatorEmailSuccsesState extends SignupStates{}
class SignupVaildatorEmailErrorState extends SignupStates{}
class SignupVaildatorPasswordSuccsesState extends SignupStates{}
class SignupVaildatorPasswordErrorState extends SignupStates{}
class SignupVaildatorRePasswordSuccsesState extends SignupStates{}
class SignupVaildatorRePasswordLoadingState extends SignupStates{}
class SignupVaildatorRePasswordErrorState extends SignupStates{}
class VisablityState extends SignupStates{}
class UnvisablityState extends SignupStates{}
class SignupLoadingState extends SignupStates{}
class SignupErrorState extends SignupStates{
  String error;
  SignupErrorState(this.error);
}
class SignupSuccsesState extends SignupStates{}
class SignupWithGmailLoadingState extends SignupStates{}
class SignupWithGmailErrorState extends SignupStates{}
class SignupWithGmailSuccsesState extends SignupStates{}