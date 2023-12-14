import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/Taps/ProfileTap/SetProfile/SetProfileScreen.dart';
import 'package:transfer_me/signUp/Cubit/SignupCubit.dart';
import 'package:transfer_me/signUp/Cubit/SignupStates.dart';

import '../Shared/Constant/Constant.dart';

class signup extends StatelessWidget {
  static const String routeName = 'signup';

  signup({super.key});

  final TextEditingController Email = TextEditingController();
  final TextEditingController Pass = TextEditingController();
  final TextEditingController re_Pass = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocProvider<SignupCubit>(
          create: (context) => SignupCubit(),
          child: BlocConsumer<SignupCubit, SignupStates>(
            builder: (context, state) {
              return Padding(
                padding: REdgeInsets.only(top: 40, left: 33, right: 33),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image: AssetImage('assets/images/oval.png')),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text('Sign Up',
                            style: TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 35.sp,
                              fontFamily: 'San Francisco Display',
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(
                          height: 40.h,
                        ),
                        Text('Email Address',
                            style: TextStyle(
                              color: Color(0xFF878787),
                              fontSize: 13.sp,
                              fontFamily: 'San Francisco Display',
                              fontWeight: FontWeight.w500,
                            )),
                        TextFormField(
                            controller: Email,
                            validator: SignupCubit.get(context).validateEmail,
                            decoration: InputDecoration(
                                suffixIcon: Email.text.isEmpty
                                    ? Icon(
                                        Icons.done,
                                      )
                                    : Icon(
                                        Icons.done,
                                        color: Colors.blue,
                                      ),
                                hintText: "Mainideas@gmail.com",
                                hintStyle: TextStyle(
                                    color: Color(0xFFC4C4C4),
                                    fontSize: 15.sp,
                                    fontFamily: 'San Francisco Display',
                                    fontWeight: FontWeight.w500),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)))),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text('Password',
                            style: TextStyle(
                              color: Color(0xFF878787),
                              fontSize: 13,
                              fontFamily: 'San Francisco Display',
                              fontWeight: FontWeight.w500,
                            )),
                        TextFormField(
                            controller: Pass,
                            obscureText:
                                SignupCubit.get(context).visble == false
                                    ? true
                                    : false,
                            validator:
                                SignupCubit.get(context).validatePassword,
                            decoration: InputDecoration(
                                suffixIcon: Pass.text.isEmpty
                                    ? Icon(Icons.visibility_off)
                                    : IconButton(
                                        onPressed: () {
                                          SignupCubit.get(context)
                                              .visablePass();
                                        },
                                        icon: SignupCubit.get(context).visble ==
                                                false
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility)),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)))),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text('Confirm Password',
                            style: TextStyle(
                              color: Color(0xFF878787),
                              fontSize: 13.sp,
                              fontFamily: 'San Francisco Display',
                              fontWeight: FontWeight.w500,
                            )),
                        TextFormField(
                            controller: re_Pass,
                            obscureText:
                                SignupCubit.get(context).visble == false
                                    ? true
                                    : false,
                            validator: SignupCubit.get(context)
                                .validateConfirmPassword,
                            decoration: InputDecoration(
                                suffixIcon: re_Pass.text.isEmpty
                                    ? Icon(Icons.visibility_off)
                                    : IconButton(
                                        onPressed: () {
                                          SignupCubit.get(context)
                                              .visablePass();
                                        },
                                        icon: SignupCubit.get(context).visble ==
                                                false
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility)),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)))),
                        SizedBox(
                          height: 30.h,
                        ),
                        InkWell(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              SignupCubit.get(context)
                                  .singup(Email.text, Pass.text, () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    SetProfileScreen.routeName,
                                    (route) => false,
                                    arguments: SignupCubit.get(context).id);
                              });
                            }
                          },
                          child: Center(
                            child: Container(
                              width: 201,
                              height: 59,
                              decoration: ShapeDecoration(
                                color: Color(0xFF5063BF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text('Sign Up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'San Francisco Display',
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: REdgeInsets.only(right: 15),
                              width: 79.w,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1.w,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFFB1B1B1),
                                  ),
                                ),
                              ),
                            ),
                            Text('or',
                                style: TextStyle(
                                  color: Color(0xFFB1B1B1),
                                  fontSize: 16.sp,
                                  fontFamily: 'San Francisco Display',
                                  fontWeight: FontWeight.w500,
                                )),
                            Container(
                              margin: REdgeInsets.only(left: 15),
                              width: 79.w,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1.w,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFFB1B1B1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                SignupCubit.get(context).signInWithGoogle(context);
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFEEEEEE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: Image(
                                    image:
                                        AssetImage('assets/images/google.png')),
                              ),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: ShapeDecoration(
                                color: Color(0xFFEEEEEE),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Image(
                                  image:
                                      AssetImage('assets/images/Facebook.png')),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account? ',
                                style: TextStyle(
                                  color: Color(0xFF878787),
                                  fontSize: 14.sp,
                                  fontFamily: 'San Francisco Display',
                                  fontWeight: FontWeight.w500,
                                )),
                            Text('Login',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 14.sp,
                                  fontFamily: 'San Francisco Display',
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            listener: (context, state) {
              if (state is SignupVaildatorEmailSuccsesState) {
              } else if (state is SignupVaildatorEmailErrorState) {
              } else if (state is SignupLoadingState) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Center(child: CircularProgressIndicator());
                  },
                );
              } else if (state is SignupVaildatorRePasswordLoadingState) {
                SignupCubit.get(context).pass = Pass.text;
              } else if (state is SignupErrorState) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: Container(
                        width: 250.w,
                        height: 170.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "error",
                              style: Constant.stringStyle(
                                  22.sp, FontWeight.w600, Colors.black, 0.0),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.red,
                              indent: 50.w,
                              endIndent: 50.w,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Center(
                              child: Text(
                                "This email was used before",
                                style: Constant.stringStyle(
                                    16.sp, FontWeight.w300, Colors.black, 0.0),
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            ElevatedButton(onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
                              fixedSize: Size(90.w, 40.h)), child: Center(
                                child: Text("Close",style: Constant.stringStyle(
                                  16.sp, FontWeight.w300, Colors.white, 0.0,),),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              // else if (state is SignupVaildatorPasswordErrorState) {}
              // else if (state is VisablityState) {}
              // else if (state is UnvisablityState) {}
            },
          ),
        ),
      ),
    );
  }
}
