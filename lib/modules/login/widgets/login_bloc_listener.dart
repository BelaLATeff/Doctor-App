import 'package:doc_app/data/models/login/login_response_body.dart';
import 'package:doc_app/modules/login/cubit_Login/login_cubit.dart';
import 'package:doc_app/routes/routes.dart';
import 'package:doc_app/theme/colors.dart';
import 'package:doc_app/utils/extensions_navigator.dart';
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
      child: const SizedBox.shrink(),
    );
  }
}
