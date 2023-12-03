import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/Taps/ProfileTap/Cubit/ProfileCubit.dart';
import 'package:transfer_me/Taps/ProfileTap/Cubit/ProfileStates.dart';

class SetProfileScreen extends StatelessWidget {
  static const String routeName = 'SetProfileScreen';

  SetProfileScreen({super.key});

  final TextEditingController firstName = TextEditingController();
  final TextEditingController LastName = TextEditingController();
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
                      padding: REdgeInsets.only(top: 30, left: 33, right: 33),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Profile',
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
                                    'Please set up your profile',
                                    style: TextStyle(
                                      color: Color(0xFFC4C4C4),
                                      fontSize: 16.sp,
                                      fontFamily: 'San Francisco Display',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      ProfileCubit.get(context).pickImage();
                                    },
                                    child: Container(
                                      width: 135.w,
                                      height: 135.h,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFF5063BF),
                                        shape: OvalBorder(),
                                      ),
                                      child: ProfileCubit.get(context).userImgFile !=null? CircleAvatar(
                                        backgroundImage: FileImage(ProfileCubit.get(context).userImgFile!),
                                      ):const ImageIcon(
                                        AssetImage('assets/images/upload.png'),
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60.h,
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
                                    'First Name',
                                    style: TextStyle(
                                      color: const Color(0xFF878787),
                                      fontSize: 13.sp,
                                      fontFamily: 'San Francisco Display',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                ],
                              ),
                              TextFormField(
                                  controller: firstName,
                                  onChanged: (value) {
                                    ProfileCubit.get(context)
                                        .setProfileNameValidation(
                                        firstName.text);
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: firstName.text.isNotEmpty
                                          ?  ProfileCubit.get(context).firstName.length>=4
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
                                      hintText: "John",
                                      hintStyle: TextStyle(
                                          color: Color(0xFFC4C4C4),
                                          fontSize: 15.sp,
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
                          SizedBox(height: 25.h,),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Last Name',
                                    style: TextStyle(
                                      color: const Color(0xFF878787),
                                      fontSize: 13.sp,
                                      fontFamily: 'San Francisco Display',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                ],
                              ),
                              TextFormField(
                                  controller: LastName,
                                  onChanged: (value) {
                                    ProfileCubit.get(context)
                                        .setProfileLastNameValidation(
                                        LastName.text);
                                  },
                                  decoration: InputDecoration(
                                      suffixIcon: LastName.text.isNotEmpty
                                          ? ProfileCubit.get(context).LastName.length>=4
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
                                          )):
                                      SizedBox(),
                                      hintText: "Snow",
                                      hintStyle: TextStyle(
                                          color: Color(0xFFC4C4C4),
                                          fontSize: 15.sp,
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
                          SizedBox(height: 50.h,),
                          ElevatedButton(onPressed: () {
                            ProfileCubit.get(context).imageToFirebaseStorage();
                            ProfileCubit.get(context).UpdateUserFirebaseData(firstName.text, LastName.text,context);
                          },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(133.w, 60.h),
                                backgroundColor: const Color(0xFF5063BF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Set',
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
