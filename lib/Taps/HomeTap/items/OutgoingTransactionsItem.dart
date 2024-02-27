import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutCubit.dart';
import 'package:transfer_me/HomeLayout/Cubit/HomeLayOutStates.dart';

import '../../../Shared/Constant/Constant.dart';
import '../../../models/transactiosModel.dart';
import '../../Settings/settingsProvider.dart';
import '../TransferDetailes.dart';

class OutgoingTransactionsItem extends StatelessWidget {
  OutgoingTransactionsItem(this.index, {super.key});
  int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit,HomeLayoutStates>(builder: (context, state) {
      return HomeLayoutCubit.get(context).outgoing.isEmpty?
      Padding(
        padding: REdgeInsets.only(left: 30,top: 15),
        child: Center(
          child: Text(
            "No outcome transactions yet",
            style: Constant.stringStyle(
                20.sp, FontWeight.w500, SettingsProvider.get(context).themeMode==ThemeMode.light? Colors.black:Colors.white, 0.0),
          ),
        ),
      )
          :
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, TransferDetails.routeName,
              arguments: TransactionModel(receiveImg: HomeLayoutCubit.get(context).outgoing[index].receiveImg,
                  senderImg: HomeLayoutCubit.get(context).outgoing[index].senderImg,
                  amountTransfer: HomeLayoutCubit.get(context).outgoing[index].amountTransfer,
                  senderName: HomeLayoutCubit.get(context).outgoing[index].senderName,
                  receiverName: HomeLayoutCubit.get(context).outgoing[index].receiverName,
                  senderAccNo: HomeLayoutCubit.get(context).outgoing[index].senderAccNo,
                  receiverAccNo: HomeLayoutCubit.get(context).outgoing[index].receiverAccNo,
                  id: HomeLayoutCubit.get(context).outgoing[index].id,
                transState: HomeLayoutCubit.get(context).outgoing[index].transState
              ));
        },
        child: Container(
          alignment: Alignment.topLeft,
          width: 157.w,
          height: 197.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: REdgeInsets.only(top: 15.0),
                child: Image(image: const AssetImage('assets/images/chart.png'),fit: BoxFit.fill,width: double.infinity.w,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: REdgeInsets.only(left: 8.0, right: 8, top: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: ShapeDecoration(
                            image:  DecorationImage(
                              image: NetworkImage(HomeLayoutCubit.get(context).outgoing[index].receiveImg),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(64.r),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 40.w,
                                ),
                                const ImageIcon(AssetImage('assets/images/outcomearrow.png'),color: Color(0xFF5163BF),)
                              ],
                            ),
                            Text("- \$${HomeLayoutCubit.get(context).outgoing[index].amountTransfer}",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: const Color(0xFF5163BF),
                                  fontSize: 16.sp,
                                  fontFamily: 'San Francisco Display',
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Padding(
                    padding: REdgeInsets.only(left: 8.0, right: 8, top: 8),
                    child: Opacity(
                        opacity: 0.60,
                        child: Text('To',
                            style: TextStyle(
                              color: const Color(0xFF1E1E1E),
                              fontSize: 10.sp,
                              fontFamily: 'San Francisco Display',
                              fontWeight: FontWeight.w500,
                            ))),
                  ),
                  Padding(
                    padding: REdgeInsets.only(left: 8.0, right: 8, top: 8),
                    child: Text(HomeLayoutCubit.get(context).outgoing[index].receiverName,
                        style: TextStyle(
                          color: const Color(0xFF1E1E1E),
                          fontSize: 12.sp,
                          fontFamily: 'San Francisco Display',
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },);
  }
}
