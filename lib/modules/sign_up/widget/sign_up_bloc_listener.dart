import 'package:doc_app/modules/sign_up/sign_up_cubit/sign_up_cubit.dart';
import 'package:doc_app/routes/routes.dart';
import 'package:doc_app/theme/colors.dart';
import 'package:doc_app/theme/text_styles.dart';
import 'package:doc_app/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),
            ),
          );
        } else if (state is SignUpSuccess) {
          showDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text("${state.signUpResponseBody.message}"),
                content: Image.asset("assets/lottie/right_mark.gif"),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pushReplacementNamed(Routes.login);
                    },
                    child: Text(
                      "Done",
                      style: TextStyles.font14BlueSemiBold,
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is SignUpFailure) {
          Get.snackbar(
              "Sorry..!", "this email or phone Number is already exist");
          context.pop();
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
