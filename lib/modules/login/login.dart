import '../../data/models/login/login_response_body.dart';
import 'cubit_Login/login_cubit.dart';
import 'widgets/already_have_account.dart';
import 'widgets/custom_divider.dart';
import 'widgets/sign_up_icon.dart';
import 'widgets/terms_and_conditions_text.dart';
import '../../routes/routes.dart';
import '../../theme/colors.dart';
import '../../theme/form_text_field.dart';
import '../../theme/text_button.dart';
import '../../theme/text_styles.dart';
import '../../utils/extensions_navigator.dart';
import '../../utils/functions.dart';
import '../../utils/spacer.dart';
import '../../utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainColor,
                ),
              ),
            );
          } else if (state is LoginSuccess) {
            userData = state.loginResponseBody.data;
            Get.snackbar(
              "Congratulations",
              "${state.loginResponseBody.message}",
              backgroundColor: Colors.black54,
              colorText: Colors.white,
            );
            context.pop();
            context.pushNamed(Routes.home, arguments: userData);
          } else if (state is LoginFailure) {
            Get.snackbar("Opps..!", "Your Email or Password is Wrong");
            context.pop();
          }
        },
        child: SafeArea(
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
                          controller:
                              context.read<LoginCubit>().emailController,
                          hintText: "Email",
                          validator: (value) =>
                              Validation.emailValidator(value),
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
                        const AlreadyHaveAnAccountText(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
