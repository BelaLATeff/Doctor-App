import 'dart:convert';
import 'dart:developer';

import '../../../data/models/login/login_request_body.dart';
import '../../../data/models/login/login_response_body.dart';
import '../../../data/web_services/api_constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginResponseBody? loginResponseBody;
  UserData? userData;
  String? name;
  final loginURl = Uri.parse(ApiConstants.baseURL + ApiConstants.login);

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  void loginRequest(LoginRequestBody loginRequestBody) async {
    final response = await http.post(
      loginURl,
      body: loginRequestBody.toJson(),
      headers: ApiConstants.headers,
    );
    emit(LoginLoading());
    try {
      if (response.statusCode == 200) {
        // log(response.body);
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        loginResponseBody = LoginResponseBody.fromJson(data);
        emit(LoginSuccess(loginResponseBody: loginResponseBody!));
      } else {
        if (response.statusCode == 401) {}
        emit(LoginFailure());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
