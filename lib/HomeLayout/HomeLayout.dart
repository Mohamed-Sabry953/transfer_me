import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutCubit.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutStates.dart';
import 'package:transfer_me/HomeLayout/drawer_item/drawer.dart';
import 'package:transfer_me/Taps/HomeTap/Home.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'Homelayout';

  HomeLayout({super.key});

  List<Icon> BottomNav = [
    Icon(
      Icons.home_sharp,
      color: Color(0xff8EDFEB),
      size: 25,
    ),
    const Icon(
      Icons.account_balance_wallet_outlined,
      color: Color(0xff8EDFEB),
      size: 25,
    ),
    const Icon(
      Icons.compare_arrows,
      color: Color(0xff8EDFEB),
      size: 30,
    ),
    const Icon(
      Icons.person_pin,
      color: Color(0xff8EDFEB),
      size: 25,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerItem(),
        backgroundColor: Colors.grey.shade400,
        body: BlocProvider(
            create: (context) =>
                HomeLayoutCubit()..getProfileDataFromFirebase(),
            child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
              builder: (context, state) {
                return Stack(
                  children: [
                    const HomeTap(),
                    Positioned(
                      bottom: 20.h,
                      right: 24.w,
                      left: 24.w,
                      child: Container(
                        padding: REdgeInsets.only(left: 33),
                        width: 327.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                            color: Color(0xff5164BF),
                            borderRadius: BorderRadius.circular(20.r)),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    HomeLayoutCubit.get(context).changeIndex(
                                      index,
                                      context
                                    );
                                  },
                                  child: Container(
                                      margin:
                                          REdgeInsets.only(top: 17, bottom: 10),
                                      width: 44,
                                      height: 80,
                                      decoration: ShapeDecoration(
                                        color: HomeLayoutCubit.get(context)
                                                    .Currentindex ==
                                                index
                                            ? Colors.white
                                            : Color(0xff5164BF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(50),
                                          ),
                                        ),
                                      ),
                                      child: BottomNav[index]));
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 35.w,
                              );
                            },
                            itemCount: 4),
                      ),
                    ),
                  ],
                );
              },
              listener: (context, state) {
                if (state is ChangeIndexStates) {}
              },
            )),
      ),
    );
  }
}
