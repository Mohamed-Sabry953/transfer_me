import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfer_me/PinScreen/Cubit/PinStates.dart';

class PinCubit extends Cubit<PinStates>{

  PinCubit():super(PininitState());
  static PinCubit get(context)=>BlocProvider.of(context);

}