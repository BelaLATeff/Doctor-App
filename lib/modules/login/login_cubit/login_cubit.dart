import 'dart:convert';
import 'dart:developer';

import 'package:doc_app/utils/constants.dart';
import 'package:doc_app/utils/shared_pref_helper.dart';
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
  final loginURl = Uri.parse(ApiConstants.baseURL + ApiConstants.login);
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  Future<void> loginRequest(LoginRequestBody loginRequestBody) async {
    final response = await http.post(loginURl,
        body: loginRequestBody.toJson(), headers: ApiConstants.headers);
    emit(LoginLoading());
    try {
      if (response.statusCode == 200) {
        // log(response.body);
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        loginResponseBody = LoginResponseBody.fromJson(data);
        await saveUserToken(loginResponseBody!.data!.token!);
        saveUserToken(loginResponseBody!.data!.token ?? "");
        saveUserName(loginResponseBody!.data!.username ?? "");
        emit(LoginSuccess(loginResponseBody: loginResponseBody!));
      } else {
        log(response.body);
        emit(LoginFailure());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> saveUserToken(String token) async {
    SharedPrefHelper.setSecuredString(ShardPrefKeys.userToken, token);
  }

  Future<void> saveUserName(String userName) async {
    await SharedPrefHelper.setData(ShardPrefKeys.userName, userName);
  }
}
