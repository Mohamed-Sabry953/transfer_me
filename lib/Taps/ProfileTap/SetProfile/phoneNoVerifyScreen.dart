import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Cubit/ProfileCubit.dart';
import '../Cubit/ProfileStates.dart';

class phoneNoVerifyScreen extends StatelessWidget {
  static const String routeName="phoneNoVerifyScreen";
  final TextEditingController verifyCode= TextEditingController();
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
                                    'Verify your Number',
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
                                    'Please verify your  Phone Number',
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
                                    'Enter Verification Code (5-digit)',
                                    style: TextStyle(
                                      color: Color(0xFF878787),
                                      fontSize: 12.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                ],
                              ),
                              TextFormField(
                                  controller: verifyCode,
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value) {
                                  },
                                  decoration: InputDecoration(
                                      hintText: '+56234',
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
                            ProfileCubit.get(context).phoneNoVerify(context,verifyCode.text);
                          },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(150.w, 60.h),
                                backgroundColor: const Color(0xFF5063BF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Verify',
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
