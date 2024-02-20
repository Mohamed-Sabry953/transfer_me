import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:transfer_me/HomeLayout/HomeLayout.dart';
import 'package:transfer_me/PinScreen/ChangePin.dart';
import 'package:transfer_me/PinScreen/Cubit/PinCuibt.dart';
import 'package:transfer_me/PinScreen/Cubit/PinStates.dart';
import '../Shared/Constant/Constant.dart';

class PinLock extends StatelessWidget {
  static const String routeName = "PinLock";

  PinLock({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
            create: (context) => PinCubit()..getPinFromFirebase(),
            lazy: false,
            child: BlocConsumer<PinCubit, PinStates>(
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: REdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 63.w,
                            height: 42.h,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                          ),
                          Text('Unlock Pin',
                              style: Constant.stringStyle(
                                  20.sp, FontWeight.w500, Colors.black, 0.0)),
                          const SizedBox(),
                          const SizedBox(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Please set your own  Pin Code',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFC4C4C4),
                            fontSize: 16.sp,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Set Pin Code (5-digit)',
                          style: TextStyle(
                            color: Color(0xFF878787),
                            fontSize: 13.sp,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 147.w,
                          height: 20.h,
                          child: PinCodeTextField(
                            enableActiveFill: true,
                            useExternalAutoFillGroup: true,
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            obscuringWidget: const SizedBox(),
                            length: 5,
                            keyboardType: TextInputType.number,
                            controller: PinCubit.get(context).pinContent,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(50),
                              borderWidth: 0.5.w,
                              activeBorderWidth: 0.5.w,
                              inactiveBorderWidth: 0.5.w,
                              disabledColor: Colors.green,
                              selectedColor: Colors.black54,
                              inactiveColor: Colors.black54,
                              fieldHeight: 20.h,
                              fieldWidth: 20.w,
                              activeFillColor:  PinCubit.get(context).pinContent.text.length<5?const Color(0xFF5163BF):
                              PinCubit.get(context).check==true?Colors.green:Colors.red,
                              selectedFillColor: Colors.blueGrey,
                              inactiveFillColor: Colors.white,
                            ),
                            onCompleted: (value) {
                              if (args.toString() == "Change Pass") {
                                PinCubit.get(context)
                                    .unLockPin(context, ChangePin.routeName);
                              } else {
                                PinCubit.get(context)
                                    .unLockPin(context, HomeLayout.routeName);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    state is SucToDelValOfPin &&
                            PinCubit.get(context).pinNum.isEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Pin is wrong",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.red),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: 42.h,
                    ),
                    Container(
                      width: 234.w,
                      height: 235.h,
                      child: GridView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: () {
                                PinCubit.get(context)
                                    .buttonPinSet((index + 1).toString());
                                PinCubit.get(context).changeButtColor(index);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(45.r),
                                child: Container(
                                  width: 15.w,
                                  height: 15.h,
                                  decoration: BoxDecoration(
                                    color: PinCubit.get(context).buttColorIndex==index?PinCubit.get(context).buttonColor==true?const Color(0xFF5163BF):Colors.white:null,
                                    border: Border.all(color: Colors.black,width: 1.w),
                                    borderRadius: BorderRadiusDirectional.circular(45.r)
                                  ),
                                  child:
                                      Center(child: Text((index + 1).toString())),
                                ),
                              ),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemCount: 9,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            PinCubit.get(context).buttonPinDelete();
                          },
                          child: Container(
                            width: 58.w,
                            height: 58.h,
                            decoration: ShapeDecoration(
                                shape: OvalBorder(side: BorderSide(width: 1.w)),
                                color: Colors.red),
                            child: const Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 23.w,
                        ),
                        Container(
                          width: 55.w,
                          height: 55.h,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(side: BorderSide(width: 1.w)),
                          ),
                          child: InkWell(
                              onTap: () {
                                PinCubit.get(context).buttonPinSet("0");
                              },
                              child: const Center(child: Text("0"))),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 55.w,
                            height: 55.h,
                            decoration: ShapeDecoration(
                                shape: OvalBorder(side: BorderSide(width: 1.w)),
                                color: Colors.black),
                            child: const Icon(
                              Icons.fingerprint,
                              size: 48,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              listener: (context, state) {},
            )),
      ),
    );
  }
}
