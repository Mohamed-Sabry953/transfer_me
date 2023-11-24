import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/models/PaymentMethodModel.dart';

import '../../../HomeLayout/Cubit/HomeLayOutCubit.dart';
import '../../../HomeLayout/Cubit/HomeLayOutStates.dart';
import '../../../Shared/Constant/Constant.dart';

class AddCardColor extends StatelessWidget {
  static const String routeName = "AddCardColor";

  AddCardColor({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as PaymentMethodModel;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: BlocProvider(
            create: (context) => HomeLayoutCubit()..getProfileDataFromFirebase(),
            child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
              builder: (context, state) {
                return Container(
                  padding: REdgeInsets.only(top: 15, left: 25, right: 33),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
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
                          SizedBox(
                            width: 50.w,
                          ),
                          Center(
                            child: Text('Card Color',
                                style: Constant.stringStyle(
                                    20.sp,
                                    FontWeight.w600,
                                    const Color(0xFF1E1E1E),
                                    0.0)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Text(
                        'Please, select a color to differential this card from other cards you have attached and organize your cards better.',
                        style: TextStyle(
                          color: const Color(0xFF878787),
                          fontSize: 15.sp,
                          fontFamily: 'San Francisco Display',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: REdgeInsets.only(top: 20),
                        width: 310.w,
                        height: 171.h,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/images/VectorVisa.png"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                          color: HomeLayoutCubit.get(context).cardColor[
                              HomeLayoutCubit.get(context).colorIndex],
                        ),
                        child: Padding(
                          padding: REdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    args.HolderName,
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
                                ],
                              ),
                              Padding(
                                padding: REdgeInsets.only(
                                    top: 10.0, left: 3, right: 17),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      args.CardNumber.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      args.ExpireDate,
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
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: REdgeInsets.only(
                                    top: 8.0, left: 2, right: 15, bottom: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$3,100.30',
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
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        height: 200.h,
                        width: 250.w,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  HomeLayoutCubit.get(context)
                                      .changeColorOfCard(index);
                                },
                                child: Container(
                                  margin:
                                      REdgeInsets.only(bottom: 10, right: 10),
                                  width: 10.w,
                                  height: 10.h,
                                  decoration: ShapeDecoration(
                                    color: HomeLayoutCubit.get(context).cardColor[index],
                                    shape: const OvalBorder(),
                                  ),
                                  child:
                                      HomeLayoutCubit.get(context).colorIndex ==
                                              index
                                          ? const Icon(
                                              Icons.done,
                                              size: 27,
                                              color: Colors.white,
                                            )
                                          : const SizedBox(),
                                ),
                              );
                            },
                            itemCount: 12),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          HomeLayoutCubit.get(context).setCardColor(
                              args.CardNumber,
                              HomeLayoutCubit.get(context).colorIndex,
                              context,
                          HomeLayoutCubit.get(context).userModel.Email??"",
                              HomeLayoutCubit.get(context).userModel.profileImage??"",
                              HomeLayoutCubit.get(context).userModel.firstname??"",
                              HomeLayoutCubit.get(context).userModel.lastname??""
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(153.w, 59.h),
                            backgroundColor: const Color(0xFF5264BE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            )),
                        child: Center(
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.sp,
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
              listener: (context, state) {},
            )),
      ),
    );
  }
}
