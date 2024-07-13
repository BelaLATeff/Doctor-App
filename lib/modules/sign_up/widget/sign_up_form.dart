import 'package:doc_app/modules/sign_up/sign_up_cubit/sign_up_cubit.dart';
import 'package:doc_app/theme/form_text_field.dart';
import 'package:doc_app/utils/spacer.dart';
import 'package:doc_app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscurePass = true;
  bool isObscurePassConfirm = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignUpCubit>().nameController,
            hintText: "Name",
            validator: (value) => Validation.nameValidator(value),
          ),
          heightSpace(20),
          AppTextFormField(
            controller: context.read<SignUpCubit>().emailController,
            hintText: "Email",
            validator: (value) => Validation.emailValidator(value),
          ),
          heightSpace(20),
          AppTextFormField(
              controller: context.read<SignUpCubit>().phoneNumberController,
              hintText: "Phone Number",
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !Validation.isPhoneNumberValid(value)) {
                  return "Please enter a valid phone number ";
                }
              }),
          heightSpace(20),
          AppTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            hintText: "Password",
            validator: (value) => Validation.passwordValidator(value),
            obscureText: isObscurePass,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscurePass = !isObscurePass;
                });
              },
              child: Icon(
                isObscurePass ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          heightSpace(20),
          AppTextFormField(
            controller: context.read<SignUpCubit>().confirmPasswordController,
            hintText: "Confirm password",
            obscureText: isObscurePassConfirm,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscurePassConfirm = !isObscurePassConfirm;
                });
              },
              child: Icon(
                isObscurePassConfirm ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) =>
                Validation.confirmPasswordValidator(value, context),
          ),
        ],
      ),
    );
  }
}
