import '../../../theme/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Already have an account yet?",
            style: TextStyles.font14DarkBlueRegular,
          ),
          TextSpan(
            text: "  Sign Up",
            style: TextStyles.font14BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
