import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/HomeLayout/HomeLayout.dart';
import 'package:transfer_me/Login/loginScreen.dart';
import 'package:transfer_me/Taps/MyWalletTap/Card/AddCardColor.dart';
import 'package:transfer_me/Taps/MyWalletTap/MyWallet.dart';
import 'package:transfer_me/Taps/ProfileTap/Cubit/ProfileCubit.dart';
import 'package:transfer_me/Taps/ProfileTap/Cubit/ProfileStates.dart';
import 'package:transfer_me/Taps/ProfileTap/ProfileTap.dart';
import 'package:transfer_me/Taps/ProfileTap/SetProfile/phoneNoScreen.dart';
import 'package:transfer_me/Taps/ProfileTap/SetProfile/phoneNoVerifyScreen.dart';
import 'package:transfer_me/signUp/SuccsesSignupScreen.dart';
import 'package:transfer_me/signUp/signup.dart';
    import 'package:firebase_core/firebase_core.dart';
import 'Taps/MyWalletTap/Card/AddCard.dart';
import 'Taps/ProfileTap/SetProfile/SetProfileScreen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
      runApp(
          BlocProvider(
              create: (context) => ProfileCubit(),
              child: BlocConsumer<ProfileCubit,ProfileStates>(
            builder: (context, state) {
              return const MyApp();
            },
            listener: (context, state) {

            },
          )));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              HomeLayout.routeName:(context)=>HomeLayout(),
              signup.routeName:(context)=>signup(),
              SuccsesSignupScreen.routeName:(context)=>SuccsesSignupScreen(),
              SetProfileScreen.routeName:(context)=>SetProfileScreen(),
              ProfileTap.routeName:(context)=>ProfileTap(),
              phoneNoScreen.routeName:(context)=>phoneNoScreen(),
              phoneNoVerifyScreen.routeName:(context)=>phoneNoVerifyScreen(),
              loginScreen.routeName:(context)=>loginScreen(),
              MyWalletTap.routeName:(context)=>MyWalletTap(),
              AddCardScreen.routeName:(context)=>AddCardScreen(),
              AddCardColor.routeName:(context)=>AddCardColor(),
            },
            initialRoute:
              signup.routeName
            // ProfileCubit.get(context).firebaseuser == null
            //   ? loginScreen.routeName
            //   : HomeLayout.routeName,
        );
      },);
  }
}