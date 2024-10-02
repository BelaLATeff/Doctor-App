import 'package:doc_app/core/theme/form_text_field.dart';
import 'package:doc_app/core/utils/validation.dart';
import 'package:doc_app/features/login/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: context.read<LoginCubit>().emailController,
      hintText: "Email",
      validator: (value) => Validation.emailValidator(value),
    );
  }
}
