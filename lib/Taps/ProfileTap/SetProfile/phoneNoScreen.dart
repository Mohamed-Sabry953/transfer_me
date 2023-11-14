import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../Cubit/ProfileCubit.dart';
import '../Cubit/ProfileStates.dart';

class phoneNoScreen extends StatelessWidget {
  static const String routeName="phoneNoScreen";
  final TextEditingController PhoneNo = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider<ProfileCubit>(create: (context) => ProfileCubit(),
            child: BlocConsumer<ProfileCubit, ProfileStates>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    autovalidateMode:AutovalidateMode.always ,
                    child: Padding(
                      padding: REdgeInsets.only(top: 35, left: 33, right: 33),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Phone Number',
                                    style: TextStyle(
                                      color: Color(0xFF1E1E1E),
                                      fontSize: 20.sp,
                                      fontFamily: 'San Francisco Display',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Text(
                                    'Please add your\nmobile phone number',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFC4C4C4),
                                      fontSize: 16.sp,
                                      fontFamily: 'San Francisco Display',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 85.h,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '* Phone Number',
                                    style: TextStyle(
                                      color: Color(0xFF878787),
                                      fontSize: 12.sp,
                                      fontFamily: 'San Francisco Display',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                ],
                              ),
                              IntlPhoneField(
                                  controller: PhoneNo,
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value) {
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: PhoneNo.text.isNotEmpty
                                          ?  ProfileCubit.get(context).firstName.length==12
                                          ?
                                      Container(
                                          margin: REdgeInsets.only(
                                              top: 10, bottom: 10, right: 10, left: 10
                                          ),
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF5063BF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20.r),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.done, color: Colors.white,
                                            size: 15,))
                                          : Container(
                                          margin: REdgeInsets.only(
                                              top: 10, bottom: 10, right: 10, left: 10
                                          ),
                                          decoration: ShapeDecoration(
                                            color: Colors.red,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  20.r),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.close_rounded, color: Colors.white,size: 15,
                                          )):SizedBox(),
                                      hintText: '8456 5846 5846',
                                      hintStyle: TextStyle(
                                          color: Color(0xFFC4C4C4),
                                          fontSize: 14.sp,
                                          fontFamily: 'San Francisco Display',
                                          fontWeight: FontWeight.w500),
                                      border: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black)
                                      )
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 62.h,),
                          ElevatedButton(onPressed: () {
                            ProfileCubit.get(context).UpdateUserPhoneNoFirebaseData(int.parse(PhoneNo.text), context);
                          },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(190.w, 60.h),
                                backgroundColor: const Color(0xFF5063BF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.sp,
                                    fontFamily: 'San Francisco Display',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              }
              , listener: (context, state) {
              if (state is SetProfileNameSuccsesValidationState) {}
              if (state is ProfileLoadingState) {
                showDialog(context: context, builder: (context) {
                  return Center(child: CircularProgressIndicator());
                },);
              }
            },)),
      ),
    );
  }
}
