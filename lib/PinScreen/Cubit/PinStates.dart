abstract class PinStates{}
class PininitState extends PinStates{}
class PinLoadingState extends PinStates{}
class SucToAddCharToPinList extends PinStates{}
class SucToUnlockState extends PinStates{}
class ErrorToUnlockState extends PinStates{}
class SucToDelValOfPin extends PinStates{}
class SucToDelFromPinList extends PinStates{}
class SucSetUserPinToFirebaseData extends PinStates{}
class LoginWithGmailSuccsesState extends PinStates{}
class PinGetDataFromFirebaseSucState extends PinStates{}