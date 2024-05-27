import '../data/models/login/login_request_body.dart';
import '../modules/login/cubit_Login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void loginButton(BuildContext context) {
  if (BlocProvider.of<LoginCubit>(context).formKey.currentState!.validate()) {
    BlocProvider.of<LoginCubit>(context).loginRequest(
      LoginRequestBody(
          email: context.read<LoginCubit>().emailController!.value.text,
          password: context.read<LoginCubit>().passwordController!.value.text),
    );
  }
}
