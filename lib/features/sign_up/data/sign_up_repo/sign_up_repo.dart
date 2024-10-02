import 'dart:convert';
import 'dart:developer';

import 'package:doc_app/core/web_services/api_constants.dart';
import 'package:doc_app/features/sign_up/data/model/sign_up_request_body.dart';
import 'package:doc_app/features/sign_up/data/model/sign_up_response_body.dart';
import 'package:http/http.dart' as http;

class SignUpRepo {
  SignUpResponseBody? signUpResponseBody;
  Future<SignUpResponseBody> signUpRequest(
      SignUpRequestBody signUpRequestBody) async {
    final signUpUrl = Uri.parse(ApiConstants.baseURL + ApiConstants.register);
    try {
      final response = await http.post(
        signUpUrl,
        body: signUpRequestBody.toJson(),
        headers: ApiConstants.headers,
      );
      if (response.statusCode == 200) {
        log(response.body);
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        signUpResponseBody = SignUpResponseBody.fromJson(data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return signUpResponseBody!;
  }
}
