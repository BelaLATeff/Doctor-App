import 'dart:convert';

import 'package:doc_app/core/utils/constants.dart';
import 'package:doc_app/core/utils/shared_pref_helper.dart';
import 'package:doc_app/core/web_services/api_constants.dart';
import 'package:doc_app/features/login/data/model/login_request_body.dart';
import 'package:doc_app/features/login/data/model/login_response_body.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  LoginResponseBody? loginResponseBody;
  final loginURl = Uri.parse(ApiConstants.baseURL + ApiConstants.login);

  Future<LoginResponseBody> loginRequest(
      LoginRequestBody loginRequestBody) async {
    final response = await http.post(loginURl,
        body: loginRequestBody.toJson(), headers: ApiConstants.headers);

    try {
      if (response.statusCode == 200) {
        // log(response.body);
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        loginResponseBody = LoginResponseBody.fromJson(data);
        await saveUserToken(loginResponseBody!.data!.token!);
        saveUserToken(loginResponseBody!.data!.token ?? "");
        saveUserName(loginResponseBody!.data!.username ?? "");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return loginResponseBody!;
  }

  Future<void> saveUserToken(String token) async {
    SharedPrefHelper.setSecuredString(ShardPrefKeys.userToken, token);
  }

  Future<void> saveUserName(String userName) async {
    await SharedPrefHelper.setData(ShardPrefKeys.userName, userName);
  }
}
