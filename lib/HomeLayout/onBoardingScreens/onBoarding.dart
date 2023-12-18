import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutCubit.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutStates.dart';
import 'package:transfer_me/HomeLayout/HomeLayout.dart';
import 'package:transfer_me/HomeLayout/onBoardingScreens/onBoardingItem.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName='onBoardingScreen';
   OnBoardingScreen({super.key});

  List<Widget>onBoardingItems=[
    OnBoardingItem(
        "assets/images/onboarding1.png",'Easy, Fast & Trusted','Fast money transfer and gauranteed safe transactions with others.'
    ),
    OnBoardingItem(
        "assets/images/onboarding2.png",'Saving Your Money','Track the progress of your savings  and start a habit of saving with TransferMe'
    ),
    OnBoardingItem(
        "assets/images/onboarding3.png",'Free Transactions','Provides the quality of the financial system  with free money transactions without any fees.'
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(create: (context) => HomeLayoutCubit(),
      child: BlocBuilder<HomeLayoutCubit,HomeLayoutStates>(
        builder: (context, state) {
          return Padding(
            padding:  REdgeInsets.only(top: 60,left: 20,right: 20),
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemBuilder: (context,index, realIndex) {
                    return Column(
                      children: [
                        onBoardingItems[index],
                        SizedBox(height: 80.h,),
                      ],
                    );
                  },
                  itemCount: onBoardingItems.length,
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 15),
                    autoPlayAnimationDuration: const Duration(milliseconds: 100),
                    onPageChanged: (index, reason) {
                      HomeLayoutCubit.get(context).changeIndexOnboarding(index);
                    },
                    viewportFraction: 1,
                    height: 495.h,
                  ),
                ),
                SizedBox(
                  width: 57.w,
                  height: 10.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            color:  HomeLayoutCubit.get(context).onBoardingIndex==index?const Color(0xFF5063BF):const Color(0xFF8EDFEB),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 13.h,
                        );
                      },
                      itemCount: 3),
                ),
                SizedBox(height: 35.h,),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);
                },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(200.w, 60.h),
                    backgroundColor: const Color(0xFF5063BF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ), child:  Center(
                    child:Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontFamily: 'San Francisco Display',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
