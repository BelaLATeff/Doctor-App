import 'colors.dart';
import 'text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? edgeInsetsGeometry;
  final String hintText;
  final Widget? suffixIcon;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? hintStyle;
  final bool? obscureText;
  final Function(String?) validator;
  final void Function(String?)? onSave;
  final TextEditingController? controller;

  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    this.edgeInsetsGeometry,
    this.suffixIcon,
    this.enabledBorder,
    this.hintStyle,
    this.focusedBorder,
    this.obscureText,
    this.onSave,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      onSaved: onSave,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.3,
                color: ColorsManager.mainColor,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.lightGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: ColorsManager.moreLightGrey,
      ),
    );
  }
}
