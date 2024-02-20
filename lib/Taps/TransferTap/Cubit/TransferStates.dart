abstract class TransferStates {}
class TransferInitState extends TransferStates{}
class TransferLoadingState extends TransferStates{}
class SucGetDataState extends TransferStates{}
class ErrorGetDataState extends TransferStates{}
class ErrorCheckAccNoState extends TransferStates{}
class SucCheckAccNoState extends TransferStates{}
class AccNoValidatorErrorState extends TransferStates{}
class AccNoValidatorSucState extends TransferStates{}
class TransferSucState extends TransferStates{}
class TransAddToFirebaseSucState extends TransferStates{}
class TransMessageSucState extends TransferStates{}
class TransErrorPinColorSucState extends TransferStates{}
class TransEmptyPinColorSucState extends TransferStates{}
