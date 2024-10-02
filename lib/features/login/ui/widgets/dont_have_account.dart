import 'package:doc_app/core/routes/routes.dart';
import 'package:doc_app/core/theme/text_styles.dart';
import 'package:doc_app/core/utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DontHaveAnAccountText extends StatelessWidget {
  const DontHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account yet?",
            style: TextStyles.font14DarkBlueRegular,
          ),
          TextSpan(
            text: "  Sign Up",
            style: TextStyles.font14BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(Routes.signUp);
              },
          ),
        ],
      ),
    );
  }
}
