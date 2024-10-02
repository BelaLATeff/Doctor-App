import 'package:doc_app/core/theme/form_text_field.dart';
import 'package:doc_app/core/utils/validation.dart';
import 'package:doc_app/features/login/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: context.read<LoginCubit>().passwordController,
      validator: (value) => Validation.passwordValidator(value),
      hintText: "Password",
      obscureText: isObscureText,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isObscureText = !isObscureText;
          });
        },
        child: Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
      ),
    );
  }
}
