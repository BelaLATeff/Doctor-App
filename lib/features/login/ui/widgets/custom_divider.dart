import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            height: 3.h,
            color: Colors.black12,
          ),
        ),
        Text(
          "  or sign in with  ",
          style: TextStyle(
            fontSize: 17.sp,
            color: Colors.black38,
          ),
        ),
        Expanded(
          child: Container(
            height: 3.h,
            color: Colors.black12,
          ),
        ),
      ],
    );
  }
}
