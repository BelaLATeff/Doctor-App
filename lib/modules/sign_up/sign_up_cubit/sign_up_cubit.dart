import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doc_app/data/models/sign_up/sign_up_request_body.dart';
import 'package:doc_app/data/models/sign_up/sign_up_response_body.dart';
import 'package:doc_app/data/web_services/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  SignUpResponseBody? signUpResponseBody;
  final signUpUrl = Uri.parse(ApiConstants.baseURL + ApiConstants.register);
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? phoneNumberController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();

  void signUpRequest(SignUpRequestBody signUpRequestBody) async {
    try {
      emit(SignUpLoading());
      final response = await http.post(
        signUpUrl,
        body: signUpRequestBody.toJson(),
        headers: ApiConstants.headers,
      );
      if (response.statusCode == 200) {
        log(response.body);
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        signUpResponseBody = SignUpResponseBody.fromJson(data);
        emit(SignUpSuccess(signUpResponseBody: signUpResponseBody!));
      } else {
        log(response.body);
        emit(SignUpFailure());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
