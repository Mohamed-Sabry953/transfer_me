import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/Taps/TransferTap/ConfirmBottomSheet/ConfirmPinBottomSheet.dart';

import '../../../models/PaymentMethodModel.dart';
import '../../Settings/settingsProvider.dart';
class ConfirmSheet extends StatelessWidget {
  String firstName;
  String lastName;
  String amount;
  int accNo;
  String img;
  int index;
  String pin;
  List<PaymentMethodModel>cards;

  ConfirmSheet(this.firstName, this.lastName, this.amount, this.accNo,this.img,this.index,this.pin,this.cards
      ,{super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350.h,
      decoration: BoxDecoration(
          color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.black:Colors.grey.shade300,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.only(top:8,left: 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon:  Icon(
                    Icons.arrow_back_rounded,
                    color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white:Colors.black,
                    size: 20,
                  ),
                ),
                const Spacer(),
                Text(
                  "Confirm transfer",
                  style: TextStyle(fontSize: 16.sp, color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white:Colors.black),
                ),
                const Spacer(),
                SizedBox(
                  width: 30.w,
                )
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            padding: REdgeInsets.all(16),
            margin: REdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.grey:Colors.black, width: 2.5.w)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Recipient : ",
                      style: TextStyle(
                        color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white:Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      "$firstName $lastName ($accNo)",
                      style: TextStyle(
                        color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white:Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      "Amount : ",
                      style: TextStyle(
                        color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white:Colors.black,
                        fontSize: 17.sp,
                      ),
                    ),
                    Text(
                      "$amount\$",
                      style: TextStyle(
                        color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white:Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            padding: REdgeInsets.only(
              left: 12,
            ),
            child: Row(
              children: [
                Text(
                  "please make sure you entered the right mobile number.\nIn case of wrong transfer we are unable to reverse the\ntransaction.",
                  style: TextStyle(
                    color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.white:Colors.black,
                    fontSize: (12.9).sp,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Divider(
            color: SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.grey:Colors.black,
            thickness: 1.sp,
            indent: 15.w,
            endIndent: 15.w,
          ),
          Padding(
            padding: REdgeInsets.only(top: 25, left: 12, right: 12),
            child: ElevatedButton(
                onPressed: () {
                  bottomConfirmBinSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.infinity.w, 50.h),
                  backgroundColor: const Color(0xFF5164BF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                )),
          )
        ],
      ),
    );
  }
  bottomConfirmBinSheet(BuildContext context){
   showDialog(context: context, builder: (context) {
     return ConfirmPin(firstName, lastName,accNo, img,amount,index,pin,cards);
   },);
  }
}
