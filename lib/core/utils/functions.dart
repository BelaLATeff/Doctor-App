import 'package:doc_app/features/login/data/model/login_request_body.dart';
import 'package:doc_app/features/login/login_cubit/login_cubit.dart';
import 'package:doc_app/features/sign_up/data/model/sign_up_request_body.dart';
import 'package:doc_app/features/sign_up/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void loginButton(BuildContext context) {
  if (BlocProvider.of<LoginCubit>(context).formKey.currentState!.validate()) {
    BlocProvider.of<LoginCubit>(context).emitLogin(
      LoginRequestBody(
        email: context.read<LoginCubit>().emailController!.value.text,
        password: context.read<LoginCubit>().passwordController!.value.text,
      ),
    );
  }
}

void signUpButton(BuildContext context) {
  if (BlocProvider.of<SignUpCubit>(context).formKey.currentState!.validate()) {
    BlocProvider.of<SignUpCubit>(context).emitSignUp(
      SignUpRequestBody(
        name: context.read<SignUpCubit>().nameController!.value.text,
        email: context.read<SignUpCubit>().emailController!.value.text,
        phone: context.read<SignUpCubit>().phoneNumberController!.value.text,
        password: context.read<SignUpCubit>().passwordController!.value.text,
        passwordConfirm:
            context.read<SignUpCubit>().confirmPasswordController!.value.text,
        gender: 0.toString(),
      ),
    );
  }
}
