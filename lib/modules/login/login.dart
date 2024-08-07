import 'package:doc_app/data/models/login/login_response_body.dart';
import 'package:doc_app/modules/login/login_cubit/login_cubit.dart';
import 'package:doc_app/modules/login/widgets/custom_divider.dart';
import 'package:doc_app/modules/login/widgets/dont_have_account.dart';
import 'package:doc_app/modules/login/widgets/login_bloc_listener.dart';
import 'package:doc_app/modules/login/widgets/sign_up_icon.dart';
import 'package:doc_app/modules/login/widgets/terms_and_conditions_text.dart';
import 'package:doc_app/theme/colors.dart';
import 'package:doc_app/theme/form_text_field.dart';
import 'package:doc_app/theme/text_button.dart';
import 'package:doc_app/theme/text_styles.dart';
import 'package:doc_app/utils/functions.dart';
import 'package:doc_app/utils/spacer.dart';
import 'package:doc_app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;
  bool isCheckBox = true;
  UserData? userData;

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
                      AppTextFormField(
                        controller: context.read<LoginCubit>().emailController,
                        hintText: "Email",
                        validator: (value) => Validation.emailValidator(value),
                      ),
                      heightSpace(20),
                      AppTextFormField(
                        controller:
                            context.read<LoginCubit>().passwordController,
                        validator: (value) =>
                            Validation.passwordValidator(value),
                        hintText: "Password",
                        obscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      heightSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isCheckBox = !isCheckBox;
                                });
                              },
                              child: Icon(
                                isCheckBox
                                    ? Icons.check_box_outline_blank_outlined
                                    : Icons.check_box,
                                color: ColorsManager.mainColor,
                              ),
                            ),
                            widthSpace(5),
                            const Expanded(
                              child: Text("Remember me"),
                            ),
                            Text(
                              "Forget Password ?",
                              style: TextStyles.font14BlueRegular,
                            ),
                          ],
                        ),
                      ),
                      heightSpace(40),
                      AppTextButton(
                        onPressed: () {
                          loginButton(context);
                        },
                        buttonText: "Login",
                        textStyle: TextStyles.font16WhiteSemiBold,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
