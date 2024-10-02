import 'package:doc_app/core/theme/colors.dart';
import 'package:doc_app/core/theme/text_button.dart';
import 'package:doc_app/core/theme/text_styles.dart';
import 'package:doc_app/core/utils/functions.dart';
import 'package:doc_app/core/utils/spacer.dart';
import 'package:doc_app/features/login/data/model/login_response_body.dart';
import 'package:doc_app/features/login/login_cubit/login_cubit.dart';
import 'package:doc_app/features/login/ui/widgets/custom_divider.dart';
import 'package:doc_app/features/login/ui/widgets/dont_have_account.dart';
import 'package:doc_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:doc_app/features/login/ui/widgets/sign_up_icon.dart';
import 'package:doc_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:doc_app/features/login/ui/widgets/text_form_field/email_text_Field.dart';
import 'package:doc_app/features/login/ui/widgets/text_form_field/password_text_field.dart';
import 'package:doc_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserData? userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
            child: Column(
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyles.font24BlueBold,
                ),
                heightSpace(8),
                Text(
                  "We're excited to have you back, can't wait to\nsee what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayBold,
                ),
                heightSpace(36),
                Form(
                  key: context.read<LoginCubit>().formKey,
                  child: Column(
                    children: [
                      const EmailTextField(),
                      heightSpace(20),
                      const PasswordTextField(),
                    ],
                  ),
                ),
                heightSpace(24),
                Row(
                  children: [
                    Checkbox(
                      value: isLoggedIn,
                      checkColor: Colors.white,
                      activeColor: ColorsManager.mainColor,
                      onChanged: (value) {
                        setState(() {
                          isLoggedIn = value!;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text("Remember me"),
                    ),
                    Text(
                      "Forget Password ?",
                      style: TextStyles.font14BlueRegular,
                    ),
                  ],
                ),
                heightSpace(24),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return state is LoginLoading
                        ? const CircularProgressIndicator()
                        : AppTextButton(
                            onPressed: () {
                              loginButton(context);
                            },
                            buttonText: "Login",
                            textStyle: TextStyles.font16WhiteSemiBold,
                          );
                  },
                ),
                heightSpace(35),
                const CustomDivider(),
                heightSpace(35),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SignUpIcons(nameIcon: "assets/svgs/google.svg"),
                    SignUpIcons(nameIcon: "assets/svgs/facebook.svg"),
                    SignUpIcons(nameIcon: "assets/svgs/apple.svg"),
                  ],
                ),
                heightSpace(35),
                const TermsAndConditionsText(),
                heightSpace(25),
                const DontHaveAnAccountText(),
                const LoginBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
