import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherTransactionsItem extends StatelessWidget {
  const OtherTransactionsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(top: 12,bottom: 10,right: 20,left: 13),
      width: 300.h,
      height: 79.w,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 57,
            height: 57,
            decoration: ShapeDecoration(
              color: Color(0xFF8EDFEB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Icon(Icons.shopping_bag_outlined,color: Colors.white,),
          ),
          Padding(
            padding: REdgeInsets.only(left: 25.0,top: 15),
            child: Column(
              children: [
                Text(
                    'Entertainment',
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 18,
                      fontFamily: 'San Francisco Display',
                      fontWeight: FontWeight.w600,)),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '23 December 2020',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 10,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 40.w,
                  ),
                  Image(image: AssetImage('assets/images/arrowtop.png'))
                ],
              ),
              Text('+ \$62.54',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF8EDFEB),
                    fontSize: 16,
                    fontFamily: 'San Francisco Display',
                    fontWeight: FontWeight.w700,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
