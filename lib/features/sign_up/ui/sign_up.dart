import 'package:doc_app/core/theme/text_button.dart';
import 'package:doc_app/core/theme/text_styles.dart';
import 'package:doc_app/core/utils/functions.dart';
import 'package:doc_app/core/utils/spacer.dart';
import 'package:doc_app/features/sign_up/ui/widget/sign_up_bloc_listener.dart';
import 'package:doc_app/features/sign_up/ui/widget/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Account",
                  style: TextStyles.font24BlueBold,
                ),
                heightSpace(20),
                Text(
                  "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                  style: TextStyles.font14GrayRegular,
                ),
                heightSpace(20),
                const SignUpForm(),
                heightSpace(40),
                AppTextButton(
                  onPressed: () {
                    signUpButton(context);
                  },
                  buttonText: "Create Account",
                  textStyle: TextStyles.font16WhiteSemiBold,
                ),
                const SignUpBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
