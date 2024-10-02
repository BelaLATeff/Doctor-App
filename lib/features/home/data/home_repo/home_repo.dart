import 'dart:convert';
import 'dart:developer';

import 'package:doc_app/core/utils/constants.dart';
import 'package:doc_app/core/utils/shared_pref_helper.dart';
import 'package:doc_app/core/web_services/api_constants.dart';
import 'package:doc_app/features/home/data/model/response_model_specialization.dart';
import 'package:http/http.dart' as http;

class HomeRepo {
  ResponseModelSpecialization? responseBodySpecialization;
  final url = ApiConstants.baseURL + ApiConstants.allSpecialization;

  Future<ResponseModelSpecialization> getAllSpecialization() async {
    final specializationResponse = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization":
          "Bearer ${await SharedPrefHelper.getSecuredString(ShardPrefKeys.userToken)}"
    });
    try {
      if (specializationResponse.statusCode == 200) {
        log(specializationResponse.body);
        final dataOfSpecialization =
            jsonDecode(specializationResponse.body) as Map<String, dynamic>;
        responseBodySpecialization =
            ResponseModelSpecialization.fromJson(dataOfSpecialization);
      }
    } catch (e) {
      throw Exception(e);
    }
    return responseBodySpecialization!;
  }
}
