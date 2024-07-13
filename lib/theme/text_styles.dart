import 'colors.dart';
import '../utils/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24BlackRegular = TextStyle(
    fontSize: 24.sp,
    color: Colors.black,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.mainColor,
  );
  static TextStyle font24BlueBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.mainColor,
  );
  static TextStyle font14GrayBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.gray,
  );
  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.gray,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.darkBlue,
  );
  static TextStyle font14DarkBlueRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.darkBlue,
  );
  static TextStyle font14LightGrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.gray,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font16DarkBlueBold = TextStyle(
    fontSize: 16.sp,
    color: ColorsManager.darkBlue,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font18WhiteMedium = TextStyle(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14BlueSemiBold = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.mainColor,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font14BlueRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.mainColor,
  );
  static TextStyle font18DarkBlueBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.darkBlue,
  );
  static TextStyle font18DarkBlueSemiBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.darkBlue,
  );
  static TextStyle font12DarkGrayRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.darkGrey,
  );
  static TextStyle font14DGrayMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.gray,
  );
}
