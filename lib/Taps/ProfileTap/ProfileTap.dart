import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/HomeLayout/drawer_item/drawer.dart';
import 'package:transfer_me/Shared/Constant/Constant.dart';
import 'package:transfer_me/Taps/ProfileTap/Cubit/ProfileCubit.dart';
import 'package:transfer_me/Taps/ProfileTap/Cubit/ProfileStates.dart';
import 'package:transfer_me/Taps/ProfileTap/ProfileInfoItem.dart';
import 'package:transfer_me/messages/completeMessage.dart';
import '../../PinScreen/pinLock.dart';
import '../Settings/settingsProvider.dart';
class ProfileTap extends StatelessWidget {
  static const String routeName = 'ProfileTap';

  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      lazy: false,
      create: (context) => ProfileCubit()..getProfileDataFromFirebase(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              await ProfileCubit.get(context).getProfileDataFromFirebase();
            },
            child: SafeArea(
              child: Scaffold(
                drawer: DrawerItem(),
                backgroundColor: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white:Colors.grey,
                body: state is SetProfileGetDataFromFirebaseSuccsesState || state is ChangePassLoadingState || state is ChangePassSucssesState
                    ? SingleChildScrollView(
                      child: Container(
                          padding: REdgeInsets.only( left: 22, right: 22),
                          color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white:Colors.black87,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(height: 17,),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
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
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Center(
                                    child: Text('Profile Settings',
                                        style: Constant.stringStyle(
                                            20.sp,
                                            FontWeight.w600,
                                            SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.black87:Colors.white,
                                            0.0)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Center(
                                child: Text('Your Profile Information',
                                    style: Constant.stringStyle(
                                        18.sp,
                                        FontWeight.w500,
                                        const Color(0xFF878787),
                                        0.0)),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Center(
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Container(
                                        width: 135.w,
                                        height: 135.h,
                                        decoration:  BoxDecoration(
                                          color: const Color(0xFF5063BF),
                                            borderRadius: BorderRadius.circular(67.r)
                                        ),
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              ProfileCubit.get(context)
                                                      .userModel
                                                      .profileImage ??
                                                  ''),
                                        )),
                                    InkWell(
                                      onTap: () {
                                        showDialogToUpdateProfilePic(
                                            context, ProfileCubit.get(context).userModel.profileImage?? "");
                                      },
                                      child: Container(
                                          width: 37.w,
                                          height: 37.h,
                                          decoration: const ShapeDecoration(
                                            color: Color(0xFF5063BF),
                                            shape: OvalBorder(),
                                          ),
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 23,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Opacity(
                                opacity: 0.80,
                                child: Text(
                                  'Personal Information',
                                  style: TextStyle(
                                    color: const Color(0xFF5164BF),
                                    fontSize: 17.sp,
                                    fontFamily: 'San Francisco Display',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              ProfileInfoItem(
                                  ProfileCubit.get(context)
                                      .userModel
                                      .accountNo
                                      .toString(),
                                  "Account Number"),
                              SizedBox(
                                height: 5.h,
                              ),
                              ProfileInfoItem(
                                  "${ProfileCubit.get(context).userModel.firstname} ${ProfileCubit.get(context).userModel.lastname}",
                                  "Username"),
                              SizedBox(
                                height: 5.h,
                              ),
                              ProfileInfoItem(
                                  ProfileCubit.get(context).userModel.Email ?? "",
                                  "Email"),
                              SizedBox(
                                height: 5.h,
                              ),
                              ProfileInfoItem(
                                  ProfileCubit.get(context)
                                      .userModel
                                      .phoneNo
                                      .toString(),
                                  "Mobile Phone"),
                              SizedBox(
                                height: 5.h,
                              ),
                              ProfileInfoItem("Gotham Road 21...", 'Address'),
                              SizedBox(
                                height: 10.h,
                              ),
                              Opacity(
                                  opacity: 0.80,
                                  child: Text('Security',
                                      style: TextStyle(
                                        color: Color(0xFF5164BF),
                                        fontSize: 17,
                                        fontFamily: 'San Francisco Display',
                                        fontWeight: FontWeight.w700,
                                      ))),
                              SizedBox(
                                height: 10.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, PinLock.routeName,arguments: "Change Pass");
                                },
                                child: Container(
                                  width: 331.w,
                                  height: 38.h,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFF4F4F4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: REdgeInsets.only(right: 10, left: 20),
                                    child: Row(
                                      children: [
                                        Text('Change Pin',
                                            style: Constant.stringStyle(
                                                12.sp,
                                                FontWeight.w400,
                                                const Color(0xFF5164BF),
                                                0.0)),
                                        const Spacer(),
                                        const Opacity(
                                          opacity: 0.40,
                                          child: Icon(Icons.arrow_forward_ios),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  ProfileCubit.get(context).changePass();
                                },
                                child: Container(
                                  width: 331.w,
                                  height: 38.h,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFF4F4F4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: REdgeInsets.only(right: 10, left: 20),
                                    child: Row(
                                      children: [
                                        Text('Change Password',
                                            style: Constant.stringStyle(
                                                12.sp,
                                                FontWeight.w400,
                                                const Color(0xFF5164BF),
                                                0.0)),
                                        const Spacer(),
                                        const Opacity(
                                          opacity: 0.40,
                                          child: Icon(Icons.arrow_forward_ios),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                margin: REdgeInsets.only(bottom: 20),
                                width: 331.w,
                                height: 38.h,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF4F4F4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                child: Padding(
                                  padding: REdgeInsets.only(right: 10, left: 20),
                                  child: Row(
                                    children: [
                                      Text('Finger Print',
                                          style: Constant.stringStyle(
                                              12.sp,
                                              FontWeight.w400,
                                              const Color(0xFF5164BF),
                                              0.0)),
                                      const Spacer(),
                                      Container(
                                        width: 40.w,
                                        height: 21.h,
                                        decoration: ShapeDecoration(
                                          color:
                                              ProfileCubit.get(context).count.isOdd
                                                  ? Color(0xFF5164BF)
                                                  : Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            ProfileCubit.get(context)
                                                .fingerPrint(1);
                                          },
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: ProfileCubit.get(context)
                                                        .count
                                                        .isOdd
                                                    ? 19.5.w
                                                    : 0,
                                              ),
                                              Container(
                                                width: 20.w,
                                                height: 20.h,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: ProfileCubit.get(context)
                                                            .count
                                                            .isOdd
                                                        ? Colors.white
                                                        : Color(0xFF5164BF)),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    )
                    : const Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        },
        listener: (context, state) {
          if(state is ChangePassLoadingState){
            showDialog(context: context, builder: (context) {
              return const Center(child: CircularProgressIndicator(),);

            },);}
            else if(state is ChangePassSucssesState){
              Navigator.pop(context);
              showDialog(context: context, builder: (context) {
                return CompleteMessage("Reset pass email is send", 257,218);
              },);
            }
          }
      ),
    );
  }

  showDialogToUpdateProfilePic(BuildContext context, String img) {
    showDialog(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => ProfileCubit()..getProfileDataFromFirebase(),
          child: BlocConsumer<ProfileCubit, ProfileStates>(
            builder: (context, state) {
              return state is ProfileLoadingState ?const Center(child: CircularProgressIndicator()):Container(
                  margin: REdgeInsets.only(
                      top: 180, bottom: 180, right: 30, left: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity.w,
                            height: 200.h,
                            decoration: ShapeDecoration(
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r)),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: ProfileCubit.get(context).userImgFile != null
                                    ? Image(
                                        image: FileImage(
                                            ProfileCubit.get(context).userImgFile!),
                                        fit: BoxFit.fill)
                                    : Image(
                                        image: NetworkImage(img),
                                        fit: BoxFit.fill,
                                      )),
                          ),
                          GestureDetector(
                            onTap: () {
                              ProfileCubit.get(context).pickImage();
                            },
                            child: Container(
                                width: 60.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  shape: BoxShape.circle
                                ),
                                child: const Icon(Icons.camera_alt_outlined,color: Colors.white70,)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              ProfileCubit.get(context).imageToFirebaseStorage();
                              ProfileCubit.get(context).updatePicUserFirebaseData(context);
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(115.w, 50.h),
                              backgroundColor: const Color(0xFF5063BF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    fontSize: 16.sp, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          SizedBox(width: 15.w,),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              fixedSize: Size(115.w, 50.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 16.sp, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h,),
                    ],
                  )
              );
            },
            listener: (context, state) {

            },
          ),
        );
      },
    );
  }
}
