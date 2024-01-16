import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutCubit.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutStates.dart';
import 'package:transfer_me/models/transactiosModel.dart';

import '../../Shared/Constant/Constant.dart';

class TransferDetails extends StatelessWidget {
  static const String routeName='TransferDetails';

  const TransferDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as TransactionModel;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: BlocProvider(create: (context) => HomeLayoutCubit(),
              lazy: false,
              child: BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(
                builder: (context, state) {
                  return Column(children: [
                    Padding(
                      padding: REdgeInsets.only(top: 20.0,left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap:(){
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
                          Center(
                            child: Text('Transaction details',
                                style: Constant.stringStyle(
                                    20.sp,
                                    FontWeight.w600,
                                    const Color(0xFF1E1E1E),
                                    0.0)),
                          ),
                           SizedBox(width: 50.w),
                        ],
                      ),
                    ),
                    Container(
                      margin: REdgeInsets.all(10),
                      padding: REdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,
                        width: 1),
                        borderRadius: BorderRadius.circular(12.r)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 35.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 110.w,
                                  height: 110.h,
                                  decoration:  BoxDecoration(
                                      color: const Color(0xFF5164BF),
                                      borderRadius: BorderRadius.circular(55.r)
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(args.senderImg),
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Padding(
                                    padding: REdgeInsets.only(left: 8.0),
                                    child: Text(" ${args.amountTransfer}\$",
                                        style: TextStyle(
                                            color: const Color(0xFF5164BF),
                                            fontSize: 18.h,
                                            fontWeight: FontWeight.w800
                                        )),
                                  ),
                                  Padding(
                                    padding: REdgeInsets.only(left: 5.0,bottom: 25),
                                    child: const Icon(Icons.arrow_right_alt,size: 80,color: Color(0xFF5164BF),),
                                  ),
                                ],),
                              Container(
                                  width: 110.w,
                                  height: 110.h,
                                  decoration:  BoxDecoration(
                                      color: const Color(0xFF5063BF),
                                      borderRadius: BorderRadius.circular(55.r)
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(args.receiveImg),
                                  )),
                              SizedBox(width: 15.w,),
                            ],
                          ),
                          SizedBox(height: 30.h,),
                          Divider(
                            color: Colors.black,
                            thickness: 2,
                            endIndent: 10.w,
                            indent: 10.w,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Row(
                              children: [
                                Text("From : ",style: TextStyle(
                                    color: const Color(0xFF5164BF),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23.sp
                                ),),
                                Text(args.senderName,style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 21.sp
                                ),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Row(
                              children: [
                                Text("To : ",style: TextStyle(
                                    color: const Color(0xFF5164BF),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23.sp
                                ),),
                                Text(args.receiverName,style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 21.sp
                                ),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Row(
                              children: [
                                Text("Date :",style: TextStyle(
                                    color: const Color(0xFF5164BF),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23.sp
                                ),),
                                Text(" 10/1/2024",style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 21.sp
                                ),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Row(
                              children: [
                                Text("Trans id : ",style: TextStyle(
                                    color: const Color(0xFF5164BF),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23.sp
                                ),),
                                Text(args.id,style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 21.sp
                                ),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Row(
                              children: [
                                Text("Trans fees : ",style: TextStyle(
                                    color: const Color(0xFF5164BF),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23.sp
                                ),),
                                Text("Free",style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 21.sp
                                ),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Row(
                              children: [
                                Text("Trans States :",style: TextStyle(
                                    color: const Color(0xFF5164BF),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23.sp
                                ),),
                                Text(" Success",style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23.sp
                                ),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                  ],);
                },
                listener: (context, state) {

                },
              )),
        ),
      ),
    );
  }
}
