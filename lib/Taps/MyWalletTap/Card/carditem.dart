import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutCubit.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutStates.dart';
import 'package:transfer_me/models/PaymentMethodModel.dart';

class CardItem extends StatelessWidget {
  CardItem(this.paymentMethodModel, {super.key});

  PaymentMethodModel paymentMethodModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit,HomeLayoutStates>(builder: (context, state) {
      return Container(
        margin: REdgeInsets.only(top: 20),
        width: 310.w,
        height: 171.h,
        decoration: BoxDecoration(
          image: const DecorationImage(image: AssetImage("assets/images/VectorVisa.png"),fit: BoxFit.fill,),
          borderRadius: BorderRadius.circular(20.r),
          color: HomeLayoutCubit.get(context).cardColor[paymentMethodModel.color!],
        ),
        child: Padding(
          padding: REdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    paymentMethodModel.HolderName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'A Debit Card',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],),
              Padding(
                padding: REdgeInsets.only(top: 10.0,left: 3,right: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      paymentMethodModel.CardNumber.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      paymentMethodModel.ExpireDate,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Opacity(
                    opacity: 0.70,
                    child: Text(
                      'Your Balance',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),),
                ],
              ),
              Padding(
                padding: REdgeInsets.only(top: 8.0,left: 2,right: 15,bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${paymentMethodModel.cardBalance.toString()}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21.sp,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Visa',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }, listener: (context, state) {

    },);
  }
}
