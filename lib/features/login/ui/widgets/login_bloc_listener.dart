import 'package:doc_app/core/routes/routes.dart';
import 'package:doc_app/core/theme/colors.dart';
import 'package:doc_app/core/utils/extensions.dart';
import 'package:doc_app/features/login/data/model/login_response_body.dart';
import 'package:doc_app/features/login/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    UserData? userData;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        // if (state is LoginLoading) {
        // showDialog(
        //   context: context,
        //   builder: (context) => const Center(
        //     child: CircularProgressIndicator(
        //       color: ColorsManager.mainColor,
        //     ),
        //   ),
        // );
        // }
        if (state is LoginSuccess) {
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
      child: const SizedBox.shrink(),
    );
  }
}
