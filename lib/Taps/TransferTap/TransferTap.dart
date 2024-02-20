import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutCubit.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutStates.dart';
import 'package:transfer_me/HomeLayout/HomeLayout.dart';
import 'package:transfer_me/HomeLayout/drawer_item/drawer.dart';
import 'package:transfer_me/Taps/TransferTap/ConfirmBottomSheet/confirmSheet.dart';
import 'package:transfer_me/Taps/TransferTap/Cubit/TransferCubit.dart';
import 'package:transfer_me/Taps/TransferTap/Cubit/TransferStates.dart';

import '../../Shared/Constant/Constant.dart';
import '../../models/PaymentMethodModel.dart';

class TransferTap extends StatelessWidget {
  static const String routeName = "TransferTap";

  TransferTap({super.key});

  final TextEditingController accNo = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController name = TextEditingController();
  final FirebaseMessaging fcm= FirebaseMessaging.instance;
  var formkey = GlobalKey<FormState>();
  bool check=false;
  @override
  Widget build(BuildContext context) {
    amount.text="0";
    return BlocProvider(
      create: (context) => HomeLayoutCubit()..getCardDataFromFirebase(),
      lazy: false,
      child: BlocBuilder<HomeLayoutCubit, HomeLayoutStates>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              drawer: DrawerItem(),
              body: SingleChildScrollView(
                  child: Container(
                      color: Colors.white,
                      child: BlocProvider(
                        create: (context) => TransferCubit()..getProfileDataFromFirebase()..getPinFromFirebase(),
                        child: BlocConsumer<TransferCubit,TransferStates>(
                            builder: (context, state) {
                              return Form(
                                key: formkey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: REdgeInsets.only(top: 15, left: 15, right: 10),
                                      child: Row(
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
                                                  borderRadius:
                                                  BorderRadius.circular(20.r),
                                                ),
                                              ),
                                              child: const Icon(
                                                Icons.arrow_back,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 37.w,
                                          ),
                                          Center(
                                            child: Text(
                                              'Money Transfer',
                                              style: TextStyle(
                                                color: Color(0xFF1E1E1E),
                                                fontSize: 18.sp,
                                                fontFamily: 'San Francisco Display',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Padding(
                                      padding: REdgeInsets.only(top: 5, left: 4, right: 8),
                                      child: SizedBox(
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
                                                    color: HomeLayoutCubit.get(
                                                        context)
                                                        .selectCardIndex ==
                                                        index
                                                        ? Color(0xFF5163BF)
                                                        : null,
                                                    shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 1.w,
                                                          color: const Color(
                                                              0xFF5163BF)),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20.r),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      const Image(
                                                          image: AssetImage(
                                                              'assets/images/visa.png')),
                                                      Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text('VISA',
                                                              style: Constant.stringStyle(
                                                                  12.sp,
                                                                  FontWeight.w500,
                                                                  HomeLayoutCubit.get(
                                                                      context)
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
                                                              "${HomeLayoutCubit.get(context).cards[index].HolderName.substring(0, 2)}...",
                                                              style: Constant.stringStyle(
                                                                  12.sp,
                                                                  FontWeight.w500,
                                                                  HomeLayoutCubit.get(
                                                                      context)
                                                                      .selectCardIndex ==
                                                                      index
                                                                      ? Colors.white
                                                                      : const Color(
                                                                      0xFF1E1E1E)
                                                                      .withOpacity(
                                                                      0.5),
                                                                  0.0)),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                        children: [
                                                          Container(),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: 3,
                                                                height: 3,
                                                                decoration:
                                                                ShapeDecoration(
                                                                  color: HomeLayoutCubit.get(
                                                                      context)
                                                                      .selectCardIndex ==
                                                                      index
                                                                      ? Colors.white
                                                                      : Color(0xFF1E1E1E)
                                                                      .withOpacity(
                                                                      0.5),
                                                                  shape:
                                                                  OvalBorder(),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                              Text(
                                                                  "${HomeLayoutCubit.get(context).cards[index].CVV.toString().substring(0, 1)}***",
                                                                  style: Constant.stringStyle(
                                                                      15.sp,
                                                                      FontWeight
                                                                          .w600,
                                                                      HomeLayoutCubit.get(context).selectCardIndex ==
                                                                          index ? Colors.white : Color(0xFF1E1E1E)
                                                                          .withOpacity(0.5), 0.0))
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
                                                              HomeLayoutCubit.get(context).selectCardIndex == index ? Colors.white
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
                                            itemCount: HomeLayoutCubit.get(context)
                                                .cards
                                                .length),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Padding(
                                      padding: REdgeInsets.only( left: 10, right: 10),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            'Available Balance',
                                            style: TextStyle(
                                              color: Color(0xFF878787),
                                              fontSize: 18.sp,
                                              fontFamily: 'San Francisco Display',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    HomeLayoutCubit.get(context).cards.isEmpty
                                        ? Padding(
                                          padding:REdgeInsets.only(top: 15, left: 15, right: 10),
                                          child: Text(
                                      "\$0",
                                      style: TextStyle(
                                          color: const Color(0xFF5163BF),
                                          fontSize: 30.sp,
                                          fontFamily: 'San Francisco Display',
                                          fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                        )
                                        : Padding(
                                          padding: REdgeInsets.only(left: 10, right: 10),
                                          child: Text(
                                      '\$${HomeLayoutCubit.get(context).cards[HomeLayoutCubit.get(context).selectCardIndex].cardBalance}',
                                      style: TextStyle(
                                          color: Color(0xFF5163BF),
                                          fontSize: 30.sp,
                                          fontFamily: 'San Francisco Display',
                                          fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                        ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Padding(
                                      padding:REdgeInsets.only(left: 20, right: 10),
                                      child: SizedBox(
                                        width: 307.w,
                                        child: Text(
                                          'Please, enter the receiver’s bank account number or phone number with the amount of transfer request in below field.',
                                          style: TextStyle(
                                            color: Color(0xFF878787),
                                            fontSize: 15.sp,
                                            fontFamily: 'San Francisco Display',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Padding(
                                      padding: REdgeInsets.only(left: 15, right: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Account No',
                                            style: TextStyle(
                                              color: Color(0xFF5265BE),
                                              fontSize: 14.sp,
                                              fontFamily: 'San Francisco Display',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Container(
                                            margin: REdgeInsets.only(right: 20),
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              onChanged: (value) {
                                                TransferCubit.get(context).checkAccNo(value);
                                                name.text=TransferCubit.get(context).name;
                                                check=TransferCubit.get(context).check;
                                              },
                                              controller: accNo,
                                              validator: TransferCubit.get(context)
                                                  .validateAccNo,
                                              decoration:  InputDecoration(
                                                suffixIcon: accNo.text!=""?TransferCubit.get(context).check==true?
                                                Container(
                                                    margin: REdgeInsets.only(
                                                        top: 10, bottom: 10, right: 10, left: 10),
                                                    decoration: ShapeDecoration(
                                                      color: Color(0xFF5063BF),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20.r),),),
                                                    child: const Icon(Icons.done, color: Colors.white, size: 15,))
                                                    :
                                                Container(
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
                                                    child: const Icon(
                                                      Icons.close_rounded, color: Colors.white,size: 15,
                                                    ))
                                                    :
                                                null
                                                ,
                                                enabledBorder: const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xFF5265BE)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 35.h,
                                          ),
                                          Text(
                                            'Enter Amount',
                                            style: TextStyle(
                                              color: Color(0xFF5265BE),
                                              fontSize: 14.sp,
                                              fontFamily: 'San Francisco Display',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Container(
                                            margin: REdgeInsets.only(right: 20),
                                            child: TextFormField(
                                              controller: amount,
                                              validator: HomeLayoutCubit.get(context).validateAmount,
                                              keyboardType: TextInputType.number,
                                              decoration:  InputDecoration(
                                                suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    amount.text=((HomeLayoutCubit.get(context).cards[
                                                    HomeLayoutCubit.get(context).selectCardIndex].cardBalance!)-5).toString();
                                                  },
                                                  child: Padding(
                                                    padding:  REdgeInsets.only(top: 16.0,right: 7),
                                                    child: Text("Max",style: TextStyle(
                                                      color: const Color(0xFF5163BF),
                                                      fontSize: 16.sp,
                                                      fontFamily: 'San Francisco Display',
                                                      fontWeight: FontWeight.w700,
                                                    ),),
                                                  ),
                                                ),
                                                enabledBorder: const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xFF5265BE)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 35.h,
                                          ),
                                          Text(
                                            'Receiver Name',
                                            style: TextStyle(
                                              color: Color(0xFF5265BE),
                                              fontSize: 14.sp,
                                              fontFamily: 'San Francisco Display',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Container(
                                            height: 40.h,
                                            margin: REdgeInsets.only(right: 20),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(0.5),
                                              border: BorderDirectional(
                                                bottom: BorderSide(
                                                  color: const Color(0xFF5163BF),
                                                  width: 0.8.w
                                                )
                                              )
                                            ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: REdgeInsets.only(left: 5,bottom: 5),
                                                  child: Text(name.text,style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.sp
                                                  ),),
                                                ),
                                                const Spacer(),
                                                name.text==TransferCubit.get(context).name &&name.text!=""?
                                                Container(
                                                  height: 20.h,
                                                    width: 20.h,
                                                    margin: REdgeInsets.only(
                                                        top: 6, bottom: 6, right: 12, left: 10
                                                    ),
                                                    decoration: ShapeDecoration(
                                                      color: const Color(0xFF5063BF),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(
                                                            20.r),
                                                      ),
                                                    ),
                                                    child: const Icon(
                                                      Icons.done, color: Colors.white,
                                                      size: 15,))
                                                    :
                                                const SizedBox(),
                                              ],
                                            )
                                          ),
                                          SizedBox(
                                            height: 40.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: REdgeInsets.only(
                                              right: 15, bottom: 15),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (formkey.currentState!
                                                  .validate()) {
                                              print(TransferCubit.get(context).userOne.pin);
                                                bottomConfirmSheet(context,
                                                   TransferCubit.get(context).userTwo.firstname!,
                                                   TransferCubit.get(context).userTwo.lastname!,
                                                     TransferCubit.get(context).userTwo.accountNo,
                                                   amount.text,
                                                  TransferCubit.get(context).userTwo.profileImage??"",
                                                    HomeLayoutCubit.get(context).selectCardIndex,
                                                  TransferCubit.get(context).userOne.pin!,
                                                  HomeLayoutCubit.get(context).cards,
                                                 );
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: Size(140.w, 55.h),
                                              backgroundColor:
                                              const Color(0xFF5164BF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(50),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Continue",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          listener: (context, state) {
                            if(state is TransferLoadingState){
                               showDialog(context: context, builder:(context) {
                                 return const Center(child: CircularProgressIndicator());
                               },);
                            }
                          },

                        )
                      ))),
            ),
          );
        },
      ),
    );
  }
  bottomConfirmSheet(BuildContext context,String firstName,String lastName,int accNo,String amount,String img,int index,String pin,List<PaymentMethodModel>cards){
    return showBottomSheet(context: context, builder: (context) {
      return ConfirmSheet(firstName, lastName, amount, accNo,img,index,pin,cards);
    },);
  }
}
