import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfer_me/PinScreen/Cubit/PinStates.dart';

class PinCubit extends Cubit<PinStates>{

  PinCubit():super(PininitState());
  static PinCubit get(context)=>BlocProvider.of(context);
  List<String>pinNum=[];
  String pinContent='';
  buttonPinSet(String pinNumChar){
    if(pinNum.length<5) {
      pinNum.add(pinNumChar);
      pinContent+=pinNumChar;
    }
    emit(SucToAddCharToPinList());
  }
}