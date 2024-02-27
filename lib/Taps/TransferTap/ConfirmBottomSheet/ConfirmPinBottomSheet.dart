import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutCubit.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutStates.dart';
import 'package:transfer_me/Taps/TransferTap/Cubit/TransferCubit.dart';
import 'package:transfer_me/Taps/TransferTap/Cubit/TransferStates.dart';

import '../../../messages/completeMessage.dart';
import '../../../models/PaymentMethodModel.dart';
import '../../Settings/settingsProvider.dart';

class ConfirmPin extends StatelessWidget {
  String firstName;
  String lastName;
  String img;
  int accNo;
  String amount;
  int index;
  String pinCode;
  List<PaymentMethodModel>cards;
  ConfirmPin(this.firstName, this.lastName,this.accNo,this.amount,this.img,this.index,this.pinCode,this.cards, {super.key});
  var formkey = GlobalKey<FormState>();
  final TextEditingController pin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocProvider(create: (context) => TransferCubit()..getProfileDataFromFirebase(),
      child: BlocConsumer<TransferCubit,TransferStates>(
        builder: (context, state) {
          return Form(
            key: formkey,
            child: Container(
              margin: REdgeInsets.only(top: 450),
              width: double.infinity,
              height: 230.h,
              decoration: BoxDecoration(
                  color:SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white:Colors.black,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      topLeft: Radius.circular(20.r))),
              child: Column(
                children: [
                  Padding(
                    padding: REdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Type your PIN Code",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.black:Colors.white
                              ),),
                          ],
                        ),
                        SizedBox(height: 25.h,),
                        BlocProvider(create: (context) => HomeLayoutCubit()..getCardDataFromFirebase(),
                        child: BlocBuilder<HomeLayoutCubit,HomeLayoutStates>(builder: (context, state) {
                          return Padding(
                            padding:REdgeInsets.only(left: 10,right: 10),
                            child: PinCodeTextField(
                              enableActiveFill: true,
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                color: Colors.green.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                              length: 5,
                              obscureText: true,
                              obscuringCharacter: '*',
                              hintCharacter: '#',
                              keyboardType: TextInputType.number,
                              controller: pin,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(8),
                                borderWidth: 0.5.w,
                                activeBorderWidth: 0.5.w,
                                inactiveBorderWidth: 0.5.w,
                                disabledColor: Colors.white,
                                selectedColor: Colors.black54,
                                inactiveColor: Colors.black54,
                                fieldHeight: 58.h,
                                fieldWidth: 48.w,
                                activeColor: Colors.white,
                                activeFillColor: pin.text.length<5?Colors.grey:TransferCubit.get(context).checkPin==true?Colors.green:Colors.red,
                                selectedFillColor: Colors.white,
                                inactiveFillColor: Colors.white,
                              ),
                              onCompleted: (value) {
                                if(value==pinCode){
                                  TransferCubit.get(context).checkPin=true;
                                  TransferCubit.get(context).newCardBal=
                                  ((cards[index].cardBalance!)
                                      -
                                      (int.parse(img)));
                                  TransferCubit.get(context).addTransactionOperateToFirebase(img,
                                    "${cards[index].id}${cards[index].CardNumber}",
                                    context,
                                    amount,
                                    firstName,
                                    lastName,
                                    accNo,
                                  );

                                }
                                else{
                                  TransferCubit.get(context).changeErrorColorOfPin();
                                  Future.delayed(const Duration(seconds: 1),() {
                                    pin.text="";
                                  TransferCubit.get(context).changeEmptyColorOfPin();
                                  },);
                                }
                              },
                              hintStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18.sp
                              ),
                            ),
                          );
                        },)),
                        SizedBox(height: 5.h,),
                        Row(
                          children: [
                            Container(
                              width: 25.w,
                              height: 25.w,
                              decoration:  BoxDecoration(
                                color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.black:Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.question_mark, size: 18.sp, color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white70:Colors.black,),
                            ),
                            SizedBox(width: 8.w,),
                            Text("Forget your pin code?",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.black:Colors.white
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    width: double.infinity.w,
                    height: 43.h,
                    color: const Color(0xFF5164BF),
                    child: Center(
                      child: state is TransferLoadingState || TransferCubit.get(context).checkPin==false?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Process",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                              )),
                          SizedBox(width: 10.w,),
                          const CircularProgressIndicator()
                        ],
                      ):
                      Text("Type your 5 digit PIN code",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.sp,
                          )),
                    ),
                  )
                ],
              ),)
            ,
          );
        },
        listener: (context, state) {
          if(state is TransMessageSucState){
            Future.delayed(const Duration(seconds: 3),() {
              return showDialog(context: context, builder: (context) {
                return CompleteMessage("The transfer process is under\n review and will be confirmed\n within 5 to 15 minutes",220,185);
              },);
            },);
          }
        },
      ),)
    ,
    );
  }
}
