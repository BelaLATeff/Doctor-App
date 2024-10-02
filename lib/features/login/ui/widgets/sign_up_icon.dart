import 'package:doc_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpIcons extends StatelessWidget {
  final String nameIcon;
  const SignUpIcons({super.key, required this.nameIcon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorsManager.lighterGrey,
      radius: 25.r,
      child: SvgPicture.asset(
        height: 25.h,
        nameIcon,
      ),
    );
  }
}
