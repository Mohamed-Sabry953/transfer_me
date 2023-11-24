import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutCubit.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutStates.dart';
import 'package:transfer_me/HomeLayout/HomeLayout.dart';
import 'package:transfer_me/HomeLayout/drawer_item/drawer.dart';
import 'package:transfer_me/Shared/Constant/Constant.dart';
import 'package:transfer_me/Taps/MyWalletTap/Card/AddCard.dart';
import 'package:transfer_me/Taps/MyWalletTap/Card/carditem.dart';
import 'package:transfer_me/models/UserModel.dart';

class MyWalletTap extends StatelessWidget {
  static const String routeName = 'MyWalletTap';

  const MyWalletTap({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as UserModel;
    return BlocProvider(
      create: (context) => HomeLayoutCubit()..getCardDataFromFirebase(),
      lazy: false,
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        builder: (context, state) {
          return Scaffold(
            drawer: DrawerItem(args),
            backgroundColor: Colors.white.withOpacity(0.9),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: REdgeInsets.only(left: 10.0, right: 10, top: 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    HomeLayout.routeName, (route) => false);
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
                            Text('My wallet',
                                style: Constant.stringStyle(
                                    20.sp, FontWeight.w600, Colors.black, 0.0)),
                            const SizedBox(),
                            const Icon(
                              Icons.notifications_active_outlined,
                              color: Colors.black,
                              size: 22,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text('Current Balance',
                            style: Constant.stringStyle(18.sp, FontWeight.w500,
                                const Color(0xFF878787), 0.0)),
                        SizedBox(
                          height: 15.h,
                        ),
                        HomeLayoutCubit.get(context).cards.isNotEmpty
                            ? state is AddBalanceLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Text(
                                    '\$${HomeLayoutCubit.get(context).Balance}',
                                    style: Constant.stringStyle(
                                        35.sp,
                                        FontWeight.w700,
                                        const Color(0xFF5163BF),
                                        0.0))
                            : Text('\$ 0',
                                style: Constant.stringStyle(
                                    35.sp,
                                    FontWeight.w700,
                                    const Color(0xFF5163BF),
                                    0.0)),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 90,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    HomeLayoutCubit.get(context)
                                        .selectCard(index);
                                  },
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    width: 307.w,
                                    height: 80.h,
                                    decoration: ShapeDecoration(
                                      color: HomeLayoutCubit.get(context)
                                                  .selectCardIndex ==
                                              index
                                          ? const Color(0xFF5163BF)
                                          : null,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1.w,
                                            color: const Color(0xFF5163BF)),
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        const Image(
                                            image: AssetImage(
                                                'assets/images/visa.png')),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('VISA',
                                                style: Constant.stringStyle(
                                                    12.sp,
                                                    FontWeight.w500,
                                                    HomeLayoutCubit.get(context)
                                                                .selectCardIndex ==
                                                            index
                                                        ? Colors.white
                                                        : const Color(
                                                            0xFF1E1E1E),
                                                    0.0)),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                                "${HomeLayoutCubit.get(context).cards[index].HolderName.substring(0, 3)}...",
                                                style: Constant.stringStyle(
                                                    12.sp,
                                                    FontWeight.w500,
                                                    HomeLayoutCubit.get(context)
                                                                .selectCardIndex ==
                                                            index
                                                        ? Colors.white
                                                        : const Color(
                                                                0xFF1E1E1E)
                                                            .withOpacity(0.5),
                                                    0.0)),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 3,
                                                  height: 3,
                                                  decoration: ShapeDecoration(
                                                    color: HomeLayoutCubit.get(
                                                                    context)
                                                                .selectCardIndex ==
                                                            index
                                                        ? Colors.white
                                                        : const Color(
                                                                0xFF1E1E1E)
                                                            .withOpacity(0.5),
                                                    shape: const OvalBorder(),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Text(
                                                    "${HomeLayoutCubit.get(context).cards[index].CVV.toString().substring(0, 1)}***",
                                                    style: Constant.stringStyle(
                                                        15.sp,
                                                        FontWeight.w600,
                                                        HomeLayoutCubit.get(
                                                                        context)
                                                                    .selectCardIndex ==
                                                                index
                                                            ? Colors.white
                                                            : const Color(
                                                                    0xFF1E1E1E)
                                                                .withOpacity(
                                                                    0.5),
                                                        0.0))
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        Text(
                                            "\$ ${HomeLayoutCubit.get(context).cards[index].cardBalance.toString()}",
                                            style: Constant.stringStyle(
                                                16.sp,
                                                FontWeight.w700,
                                                HomeLayoutCubit.get(context)
                                                            .selectCardIndex ==
                                                        index
                                                    ? Colors.white
                                                    : const Color(0xFF5163BF),
                                                0.0)),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 7.w,
                                );
                              },
                              itemCount:
                                  HomeLayoutCubit.get(context).cards.length),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 9,
                    (context, index) {
                      return Container(
                        margin:
                            REdgeInsets.symmetric(vertical: 10, horizontal: 8),
                        width: 105.w,
                        height: 112.h,
                        decoration: ShapeDecoration(
                          color: index < 3
                              ? Colors.black
                              : 3 < index && index < 6
                                  ? Colors.white
                                  : index == 3
                                      ? Color(0xFFE80B26)
                                      : Colors.green.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color: const Color(0x14000000),
                              blurRadius: 10.r,
                              offset: const Offset(0, 4),
                              spreadRadius: 0.r,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.h,
                              decoration: ShapeDecoration(
                                color: Colors.grey.shade200,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r)),
                              ),
                              child: const ImageIcon(
                                AssetImage('assets/images/Electric.png'),
                                size: 25,
                                color: Color(0xff8EDFEB),
                              ),
                            ),
                            SizedBox(
                              height: 22.h,
                            ),
                            SizedBox(
                              width: 87.w,
                              child: Text('Electricity',
                                  textAlign: TextAlign.center,
                                  style: Constant.stringStyle(
                                      12,
                                      FontWeight.w500,
                                      index < 3
                                          ? Colors.white
                                          : Color(0xFF001A4C),
                                      0.0)),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: REdgeInsets.only(left: 13, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Cards',
                          style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontSize: 18.sp,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AddCardScreen.routeName);
                          },
                          child: const Icon(
                            Icons.add_circle_outline,
                            size: 27,
                            color: Color(0xff5364BE),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20.h,
                  ),
                ),
                SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return HomeLayoutCubit.get(context).cards.isNotEmpty
                        ? Column(
                            children: [
                              CardItem(
                                  HomeLayoutCubit.get(context).cards[index]),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          )
                        : Center(
                            child: Text(
                              "No Cards add yet",
                              style: Constant.stringStyle(
                                  20.sp, FontWeight.w500, Colors.black, 0.0),
                            ),
                          );
                  },
                      childCount: HomeLayoutCubit.get(context).cards.isNotEmpty
                          ? HomeLayoutCubit.get(context).cards.length
                          : 1),
                  itemExtent: 270,
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20.h,
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
