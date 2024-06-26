import 'colors.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final TextStyle textStyle;
  const AppTextButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.textStyle});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorsManager.mainColor),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStateProperty.all(
          const Size(double.infinity, 52),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
