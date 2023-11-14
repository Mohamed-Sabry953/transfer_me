import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutCubit.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutStates.dart';
import 'package:transfer_me/Taps/MyWalletTap/Card/AddCardColor.dart';
import 'package:transfer_me/models/PaymentMethodModel.dart';

import '../../../Shared/Constant/Constant.dart';

class AddCardScreen extends StatelessWidget {
  static const String routeName = "AddCardScreen";

  AddCardScreen({super.key});

  final TextEditingController CardNo = TextEditingController();
  final TextEditingController Name = TextEditingController();
  final TextEditingController ExpireDate = TextEditingController();
  final TextEditingController CVV = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: BlocProvider(
            create: (context) => HomeLayoutCubit(),
            child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
              builder: (context, state) {
                return Container(
                  padding: REdgeInsets.only(top: 15, left: 33, right: 33),
                  color: Colors.white,
                  child: Form(
                    key: formkey,
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
                              child: Text('Add Card',
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
                          'To add a new card, please fill out the fields below carefully in order to add card successfully.',
                          style: TextStyle(
                            color: Color(0xFF878787),
                            fontSize: 15.sp,
                            fontFamily: 'San Francisco Display',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Card Number',
                              style: TextStyle(
                                color: Color(0xFF5265BE),
                                fontSize: 14.sp,
                                fontFamily: 'San Francisco Display',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            TextFormField(
                                controller: CardNo,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF5164BF))),
                                    hintText: '0931-5131-5321-6477',
                                    hintStyle: TextStyle(
                                        color: Color(0xFFC4C4C4),
                                        fontSize: 15.sp,
                                        fontFamily: 'San Francisco Display',
                                        fontWeight: FontWeight.w500),
                                    border: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)))),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Holder’s Name',
                              style: TextStyle(
                                color: Color(0xFF5265BE),
                                fontSize: 14.sp,
                                fontFamily: 'San Francisco Display',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            TextFormField(
                                controller: Name,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF5164BF))),
                                    hintText: 'William Smith',
                                    hintStyle: TextStyle(
                                        color: Color(0xFFC4C4C4),
                                        fontSize: 15.sp,
                                        fontFamily: 'San Francisco Display',
                                        fontWeight: FontWeight.w500),
                                    border: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)))),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expiry Date',
                              style: TextStyle(
                                color: Color(0xFF5265BE),
                                fontSize: 14.sp,
                                fontFamily: 'San Francisco Display',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            TextFormField(
                                controller: ExpireDate,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF5164BF))),
                                    hintText: '11/25',
                                    hintStyle: TextStyle(
                                        color: Color(0xFFC4C4C4),
                                        fontSize: 15.sp,
                                        fontFamily: 'San Francisco Display',
                                        fontWeight: FontWeight.w500),
                                    border: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)))),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CVV',
                              style: TextStyle(
                                color: Color(0xFF5265BE),
                                fontSize: 14.sp,
                                fontFamily: 'San Francisco Display',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            TextFormField(
                                controller: CVV,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF5164BF))),
                                    hintText: '8824',
                                    hintStyle: TextStyle(
                                        color: Color(0xFFC4C4C4),
                                        fontSize: 15.sp,
                                        fontFamily: 'San Francisco Display',
                                        fontWeight: FontWeight.w500),
                                    border: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)))),
                          ],
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              HomeLayoutCubit.get(context)
                                  .AddPaymentMethodTofirebase(
                                      int.parse(CardNo.text),
                                      Name.text,
                                      ExpireDate.text,
                                      int.parse(CVV.text));
                            }
                            Navigator.pushNamed(context, AddCardColor.routeName,
                                arguments: PaymentMethodModel(
                                    CardNumber: CardNo.text,
                                    HolderName: Name.text,
                                    ExpireDate: ExpireDate.text,
                                    CVV: 0,
                                    id: ""));
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(153.w, 59.h),
                              backgroundColor: Color(0xFF5264BE),
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
                  ),
                );
              },
              listener: (context, state) {},
            )),
      ),
    );
  }
}
