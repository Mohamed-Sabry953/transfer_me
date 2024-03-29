import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:transfer_me/Taps/MyWalletTap/MyWallet.dart';
import 'package:transfer_me/Taps/ProfileTap/ProfileTap.dart';
import 'package:transfer_me/Taps/Settings/settings.dart';
import 'package:transfer_me/Taps/TransferTap/TransferTap.dart';
import '../../Taps/ProfileTap/Cubit/ProfileCubit.dart';
import '../../Taps/ProfileTap/Cubit/ProfileStates.dart';
import '../../Taps/Settings/settingsProvider.dart';
import '../Cubit/HomeLayOutCubit.dart';
import '../Cubit/HomeLayOutStates.dart';

class DrawerItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit()..getProfileDataFromFirebase(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
                color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white:Colors.black87,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r))),
            margin: REdgeInsets.only(right: 100),
            height: double.infinity,
            width: double.infinity,
            child: state is ProfileGetDataFromFirebaseSuccsesState?Padding(
              padding: REdgeInsets.only(top: 43, left: 38, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 85.w,
                      height: 85.h,
                      decoration:  BoxDecoration(
                        color: const Color(0xFF5063BF),
                        borderRadius: BorderRadius.circular(42.r)
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            HomeLayoutCubit.get(context)
                                .userModel
                                .profileImage ??
                                ''),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "${HomeLayoutCubit.get(context).userModel.firstname} ${HomeLayoutCubit.get(context).userModel.lastname}",
                    style: TextStyle(
                      color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.black:Colors.white,
                      fontSize: 20.sp,
                      fontFamily: 'San Francisco Display',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.only(top: 6.0, ),
                    child: Text(
                      HomeLayoutCubit.get(context).userModel.Email??"",
                      style: TextStyle(
                        color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xFF827F7F):Colors.white70,
                        fontSize: 15.sp,
                        fontFamily: 'San Francisco Display',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyWalletTap.routeName);
                    },
                    child: Row(
                      children: [
                         Icon(
                          Icons.account_balance_wallet_outlined,
                          color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xff8EDFEB):Colors.white,
                          size: 25,
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        Text(
                          'My Wallet',
                          style: TextStyle(
                            color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xFF1E1E1E):const Color(0xFF5164BF),
                            fontSize: 18.sp,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProfileTap.routeName);
                    },
                    child: Row(
                      children: [
                         Icon(
                          Icons.person_pin,
                          color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xff8EDFEB):Colors.white,
                          size: 25,
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xFF1E1E1E):const Color(0xFF5164BF),
                            fontSize: 18.sp,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                    },
                    child: Row(
                      children: [
                         Icon(
                          Icons.insert_chart_outlined_rounded,
                          color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xff8EDFEB):Colors.white,
                          size: 25,
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        Text(
                          'Statistics ',
                          style: TextStyle(
                            color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xFF1E1E1E):const Color(0xFF5164BF),
                            fontSize: 18.sp,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '(coming soon) ',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 11.sp,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, TransferTap.routeName);
                    },
                    child: Row(
                      children: [
                         Icon(
                          Icons.compare_arrows,
                          color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xff8EDFEB):Colors.white,
                          size: 25,
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        Text(
                          'Transfer',
                          style: TextStyle(
                            color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xFF1E1E1E):const Color(0xFF5164BF),
                            fontSize: 18.sp,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Settings.routeName);
                    },
                    child: Row(
                      children: [
                         Icon(
                          Icons.settings,
                          color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xff8EDFEB):Colors.white,
                          size: 25,
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xFF1E1E1E):const Color(0xFF5164BF),
                            fontSize: 18.sp,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  BlocBuilder<ProfileCubit,ProfileStates>(builder: (context, state) {
                    return ElevatedButton(
                        onPressed: () {
                          ProfileCubit.get(context).Logout(context);
                          GoogleSignIn().signOut();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(175.w, 59.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          backgroundColor: const Color(0xFF5164BF),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.logout,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Text(
                                'Log out',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.sp,
                                  fontFamily: 'San Francisco Display',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ));
                  },)
                ],
              ),
            ):const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  DrawerItem({super.key});
}
