import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutStates.dart';
import 'package:transfer_me/Taps/HomeTap/items/IncomingTransItem.dart';
import 'package:transfer_me/Taps/HomeTap/items/OtherTransactionsItem.dart';
import 'package:transfer_me/Taps/HomeTap/items/OutgoingTransactionsItem.dart';

import '../../HomeLayout/Cubit/HomeLayOutCubit.dart';
import '../../Shared/Constant/Constant.dart';
import '../Settings/settingsProvider.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            height: 1100.h,
            width: double.infinity,
            color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white70:Colors.black87,
            child: Padding(
              padding: REdgeInsets.only(left: 10.0, right: 10, top: 25,bottom: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: REdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child:  Icon(
                            Icons.menu_outlined,
                            color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.black:Colors.white,
                            size: 20,
                          ),
                        ),
                        const Spacer(),
                        Stack(
                          children: [
                            Padding(
                              padding: REdgeInsets.only(left: 4,top: 3),
                              child: Icon(
                                Icons.notifications_active_outlined,
                                color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.black:Colors.white,
                                size: 22,
                              ),
                            ),
                            Container(
                              width: 10.w,
                              height: 10.h,
                              decoration: const ShapeDecoration(shape: CircleBorder(),
                              color: Colors.red),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: REdgeInsets.only(left: 100,bottom: 5),
                    child: Column(
                      children: [
                        Text('Current Balance',
                            style: TextStyle(
                              color:SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xFF878787):Colors.white ,
                              fontSize: 18.sp,
                              fontFamily: 'San Francisco Display',
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text("\$${HomeLayoutCubit.get(context).Balance}",
                            style: TextStyle(
                              color: Color(0xFF5163BF),
                              fontSize: 35.sp,
                              fontFamily: 'San Francisco Display',
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                   Divider(color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.black45:Colors.white70,thickness: 2,),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 90,
                    child: HomeLayoutCubit.get(context).cards.isEmpty?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No Cards add yet",
                          style: Constant.stringStyle(
                              20.sp, FontWeight.w500, SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.black:Colors.white, 0.0),
                        )
                      ],
                    )
                        :
                    ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              HomeLayoutCubit.get(context).selectCard(index);
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              width: 307.w,
                              height: 80.h,
                              decoration: ShapeDecoration(
                                color: HomeLayoutCubit.get(context)
                                    .selectCardIndex ==
                                    index
                                    ? Color(0xFF5163BF)
                                    : null,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.w,
                                      color: const Color(0xFF5163BF)),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Image(
                                      image:
                                      AssetImage('assets/images/visa.png')),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('VISA',
                                          style: Constant.stringStyle(
                                              12.sp,
                                              FontWeight.w500,
                                              HomeLayoutCubit.get(context)
                                                  .selectCardIndex ==
                                                  index
                                                  ? Colors.white
                                                  : const Color(0xFF1E1E1E),
                                              0.0)),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                          "${
                                              HomeLayoutCubit.get(context)
                                                  .cards[index]
                                                  .HolderName
                                                  .substring(0, 2)
                                          }...",
                                          style: Constant.stringStyle(
                                              12.sp,
                                              FontWeight.w500,
                                              HomeLayoutCubit.get(context)
                                                  .selectCardIndex ==
                                                  index
                                                  ? Colors.white
                                                  : const Color(0xFF1E1E1E)
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
                                                  : Color(0xFF1E1E1E)
                                                  .withOpacity(0.5),
                                              shape: OvalBorder(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                              "${HomeLayoutCubit.get(context).cards[index].CVV.toString().substring(0,1)}***",
                                              style: Constant.stringStyle(
                                                  15.sp,
                                                  FontWeight.w600,
                                                  HomeLayoutCubit.get(context)
                                                      .selectCardIndex ==
                                                      index
                                                      ? Colors.white
                                                      : Color(0xFF1E1E1E)
                                                      .withOpacity(0.5),
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
                                              : Color(0xFF5163BF),
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
                        itemCount: HomeLayoutCubit.get(context).cards.length),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                   Divider(color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.black45:Colors.white70,thickness: 2,),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Text('Incoming Transactions',
                          style: TextStyle(
                            color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xFF878787):Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w500,
                          )),
                      Spacer(),
                      Text('See All',
                          style: TextStyle(
                            color: Color(0xFF5163BF),
                            fontSize: 14.sp,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w400,
                          )),
                      Icon(Icons.arrow_forward_ios,size: 10,color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xFF878787):Colors.white,),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 200.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return IncomingTransItem(index) ;
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 14.w,
                          );
                        },
                        itemCount: HomeLayoutCubit.get(context).inComing.isEmpty? 1:HomeLayoutCubit.get(context).inComing.length),
                  ) ,
                  SizedBox(
                    height: 20.h,
                  ),
                   Divider(color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.black45:Colors.white70,thickness: 2,),
                  SizedBox(height: 20.h,),
                  Row(
                    children:  [
                      Text('Outgoing Transactions',
                          style: TextStyle(
                            color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xFF878787):Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w500,
                          )),
                      const Spacer(),
                      Text('See All',
                          style: TextStyle(
                            color: const Color(0xFF5163BF),
                            fontSize: 14.sp,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w400,
                          )),
                      Icon(Icons.arrow_forward_ios,size: 10,color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xFF878787):Colors.white,),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 200.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return OutgoingTransactionsItem(index) ;
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 14.w,
                          );
                        },
                        itemCount: HomeLayoutCubit.get(context).outgoing.isEmpty? 5:HomeLayoutCubit.get(context).outgoing.length),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                   Divider(color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.black45:Colors.white70,thickness: 2,),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      Text('Other Transactions',
                          style: TextStyle(
                            color: SettingsProvider.get(context).themeMode==ThemeMode.light? const Color(0xFF878787):Colors.white,
                            fontSize: 18,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w500,
                          )),
                      Spacer(),
                      Text('See All',
                          style: TextStyle(
                            color: Color(0xFF5163BF),
                            fontSize: 14,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w400,
                          )),
                      Icon(Icons.arrow_forward_ios,size: 10,),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 330.w,
                    height: 80.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SizedBox(width: 14.w,);
                        }, separatorBuilder: (context, index) {
                      return OtherTransactionsItem();
                    }, itemCount: 5),
                  )

                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
      },
    );
  }
}
