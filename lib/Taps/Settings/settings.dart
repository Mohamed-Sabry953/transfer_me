import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:transfer_me/HomeLayout/HomeLayout.dart';
import 'package:transfer_me/HomeLayout/drawer_item/drawer.dart';
import 'package:transfer_me/Taps/ProfileTap/Cubit/ProfileCubit.dart';
import 'package:transfer_me/Taps/Settings/settingsProvider.dart';
import '../../Shared/Constant/Constant.dart';
import '../ProfileTap/Cubit/ProfileStates.dart';
class Settings extends StatefulWidget {
  static const String routeName="Settings";
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white:Colors.black,
      drawer: DrawerItem(),
      body: Container(
        margin: REdgeInsets.only(
          left: 10,
          top: 10
        ),
        color:SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white:Colors.black,
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);
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
                const Spacer(),
                Center(
                  child: Text('Settings',
                      style: Constant.stringStyle(
                          20.sp,
                          FontWeight.w600,
                          const Color(0xFF5163BF),
                          0.0)),
                ),
                const Spacer(),
                SizedBox(width: 40.w,)
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              margin: REdgeInsets.only(
                right: 15
              ),
              padding: REdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF5164BF)),
                borderRadius: BorderRadius.circular(12.r)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: REdgeInsets.only(left: 45,top: 10),
                    child: Row(
                      children: [
                        Text("Language",style: TextStyle(
                            color: const Color(0xFF5163BF),
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.only(top: 25.0,left:80 ),
                    child: Row(
                      children: [
                        DropdownButtonHideUnderline(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: const Color(0xFF5163BF)),

                            ),
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              style: const TextStyle(
                                color: Color(0xFF5164BF),
                              ),
                              hint: Text(
                                SettingsProvider.get(context).selectedValue,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: SettingsProvider.get(context).items
                                  .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                                  .toList(),
                              value: SettingsProvider.get(context).selectedValue,
                              onChanged: (String? value) {
                                SettingsProvider.get(context).changeLangMenuVal(value!);
                                setState(() {

                                });
                              },
                              buttonStyleData:  ButtonStyleData(
                                  padding: REdgeInsets.symmetric(horizontal: 16),
                                  height: 60.h,
                                  width: 230,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                  )
                              ),
                              menuItemStyleData:  MenuItemStyleData(
                                height: 40.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.only(left: 45,top: 25),
                    child: Row(
                      children: [
                        Text("Mode",style: TextStyle(
                            color: const Color(0xFF5163BF),
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.only(top: 25.0,left:80 ),
                    child: Row(
                      children: [
                        DropdownButtonHideUnderline(
                          child: Container(
                            decoration: BoxDecoration(
                              color: SettingsProvider.get(context).themeMode==ThemeMode.light?null:Colors.white,
                              border: Border.all(width: 1,color: const Color(0xFF5164BF)),

                            ),
                            child: DropdownButton2<String>(
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: const Color(0xFF5164BF)
                              ),
                              isExpanded: true,
                              hint: Text(
                                SettingsProvider.get(context).selectedModeValue,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: SettingsProvider.get(context).modeItems
                                  .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                                  .toList(),
                              value: SettingsProvider.get(context).selectedModeValue,
                              onChanged: (String? value) {
                                SettingsProvider.get(context).changeModeMenuVal(value!);
                                SettingsProvider.get(context).changeTheme();
                                setState(() {
                                });
                              },
                              buttonStyleData:  ButtonStyleData(
                                  padding: REdgeInsets.symmetric(horizontal: 16),
                                  height: 60.h,
                                  width: 230,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                  )
                              ),
                              menuItemStyleData:  MenuItemStyleData(
                                height: 40.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.h,),
                  BlocProvider(create: (context) => ProfileCubit(),
                  child: BlocBuilder<ProfileCubit,ProfileStates>(builder: (context, state) {
                    return ElevatedButton(
                        onPressed: () {
                          ProfileCubit.get(context).Logout(context);
                          GoogleSignIn().signOut();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(160.w, 59.h),
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
                                'Logout',
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
                  },),),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
