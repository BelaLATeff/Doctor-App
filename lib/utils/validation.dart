import 'package:doc_app/modules/sign_up/sign_up_cubit/sign_up_cubit.dart';
import 'package:doc_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Validation {
  static String? emailValidator(String? email) {
    if (email.isNullOrEmpty()) {
      return "Email is Required";
    }
    if (!email!.contains("@")) {
      return "Please Enter valid Email";
    }
    if (!email.contains("@") || !email.contains("co")) {
      return "Please Enter valid Email";
    }

    return null;
  }

  static String? passwordValidator(String? password) {
    if (password.isNullOrEmpty()) {
      return "Password is Required";
    }
    if (password!.length < 8) {
      return "Must be at least 8 character";
    }
    return null;
  }

  static String? confirmPasswordValidator(
      String? confirmPassword, BuildContext context) {
    if (confirmPassword.isNullOrEmpty()) {
      return "Password is Required";
    }
    if (confirmPassword!.length < 8) {
      return "Must be at least 8 character";
    }
    if (confirmPassword !=
        context.read<SignUpCubit>().passwordController!.text) {
      return "Password Not Matching";
    }
    return null;
  }

  static String? nameValidator(String? name) {
    if (name.isNullOrEmpty()) {
      return "Please Enter Your Name";
    }
    if (name!.length < 3) {
      return "Must be at least 3 character";
    }
    return null;
  }

  static bool isPhoneNumberValid(String? phoneNumber) {
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber!);
  }
}
