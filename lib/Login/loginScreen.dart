import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/HomeLayout/HomeLayout.dart';
import 'package:transfer_me/Login/Cubit/LoginCubit.dart';
import 'package:transfer_me/Login/Cubit/LoginStates.dart';
import 'package:transfer_me/signUp/signup.dart';

class loginScreen extends StatelessWidget {
  static const String routeName="loginScreen";
  final TextEditingController Email = TextEditingController();
  final TextEditingController Pass = TextEditingController();
  final TextEditingController re_Pass = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocProvider<LoginCubit>(create: (context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginStates>(
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
                        SizedBox(height: 20.h,),
                        Text('Log in',
                            style: TextStyle(
                              color: const Color(0xFF1E1E1E),
                              fontSize: 35.sp,
                              fontFamily: 'San Francisco Display',
                              fontWeight: FontWeight.w700,)),
                        SizedBox(height: 80.h,),
                        Text(
                            'Email Address',
                            style: TextStyle(
                              color: Color(0xFF878787),
                              fontSize: 13.sp,
                              fontFamily: 'San Francisco Display',
                              fontWeight: FontWeight.w500,)),
                        TextFormField(
                            controller: Email,
                            decoration: InputDecoration(
                                suffixIcon: Email.text.isEmpty
                                    ? Icon(Icons.done,): Icon(Icons.done,color: Colors.blue,),
                                hintText: "Mainideas@gmail.com",
                                hintStyle: TextStyle(
                                    color: Color(0xFFC4C4C4),
                                    fontSize: 15.sp,
                                    fontFamily: 'San Francisco Display',
                                    fontWeight: FontWeight.w500),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                )
                            )
                        ),
                        SizedBox(height: 25.h,),
                        Text(
                            'Password',
                            style: TextStyle(
                              color: Color(0xFF878787),
                              fontSize: 13.sp,
                              fontFamily: 'San Francisco Display',
                              fontWeight: FontWeight.w500,)),
                        TextFormField(
                            controller: Pass,
                            decoration: InputDecoration(
                                suffixIcon:Pass.text.isEmpty?
                                Icon(Icons.visibility_off)
                                    :
                                IconButton(onPressed: (){
                                }, icon:Icon(Icons.visibility_off),),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                )
                            )
                        ),
                        SizedBox(height: 60.h,),
                        InkWell(
                          onTap: () {
                            LoginCubit.get(context).login(Email.text, Pass.text, context);
                          },
                          child: Center(
                            child: Container(
                              width: 201.w,
                              height: 59.h,
                              decoration: ShapeDecoration(
                                color: Color(0xFF5063BF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.sp,
                                      fontFamily: 'San Francisco Display',
                                      fontWeight: FontWeight.w600,)),
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
                            Text(
                                'or',
                                style: TextStyle(
                                  color: Color(0xFFB1B1B1),
                                  fontSize: 16.sp,
                                  fontFamily: 'San Francisco Display',
                                  fontWeight: FontWeight.w500,)),
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
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                LoginCubit.get(context).signInWithGoogle(context);
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
                                child: Image(image: AssetImage('assets/images/google.png')),
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
                              child: Image(image: AssetImage('assets/images/Facebook.png')),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Don’t have an account?',
                                style: TextStyle(
                                  color: Color(0xFF878787),
                                  fontSize: 14.sp,
                                  fontFamily: 'San Francisco Display',
                                  fontWeight: FontWeight.w500,)),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, signup.routeName);
                              },
                              child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 14.sp,
                                    fontFamily: 'San Francisco Display',
                                    fontWeight: FontWeight.w500,)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }, listener: (context, state) {
            }
            // else if (state is SignupVaildatorPasswordErrorState) {}
            // else if (state is VisablityState) {}
            // else if (state is UnvisablityState) {},
        ),
      ),
      )
    );
  }
}
