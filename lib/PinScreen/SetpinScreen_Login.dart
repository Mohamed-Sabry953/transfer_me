import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/PinScreen/Cubit/PinCuibt.dart';
import 'package:transfer_me/PinScreen/Cubit/PinStates.dart';
import 'package:transfer_me/Taps/ProfileTap/SetProfile/phoneNoScreen.dart';
import '../Shared/Constant/Constant.dart';

class SetPin_Login extends StatelessWidget {
  static const String routeName = "SetPinLogin";

  const SetPin_Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
            create: (context) => PinCubit(),
            child: BlocConsumer<PinCubit, PinStates>(
              builder: (context, state) {
                return Column(
                  children: [
                    Padding(
                      padding: REdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  phoneNoScreen.routeName, (route) => false);
                            },
                            child: Container(
                              width: 63.w,
                              height: 42.h,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF5164BF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text('Set Pin Code',
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
                      height: 28.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 147.w,
                          height: 20.h,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 20.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    color:
                                        PinCubit.get(context).pinNum.length ==
                                                    index + 1 ||
                                                PinCubit.get(context)
                                                        .pinNum
                                                        .length >
                                                    index
                                            ? const Color(0xFF5164BF)
                                            : null,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 10.h,
                                );
                              },
                              itemCount: 5),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
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
                              },
                              child: Container(
                                width: 15.w,
                                height: 15.h,
                                decoration: ShapeDecoration(
                                  shape:
                                      OvalBorder(side: BorderSide(width: 1.w)),
                                ),
                                child:
                                    Center(child: Text((index + 1).toString())),
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
                        Container(
                          width: 58.w,
                          height: 58.h,
                          decoration: ShapeDecoration(
                              shape: OvalBorder(side: BorderSide(width: 1.w)),
                              color: Colors.black),
                          child: const Icon(
                            Icons.fingerprint,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        PinCubit.get(context).updateUserPinFirebaseData(context);
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(117.w, 50.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        backgroundColor: const Color(0xFF5164BF),
                      ),
                      child: Text(
                        'Set',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontFamily: 'San Francisco Display',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                );
              },
              listener: (context, state) {},
            )),
      ),
    );
  }
}
