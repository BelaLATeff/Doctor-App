import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doc_app/data/models/home/response_model_specialixation.dart';
import 'package:doc_app/data/models/home/specializations_data.dart';
import 'package:doc_app/data/web_services/api_constants.dart';
import 'package:doc_app/utils/constants.dart';
import 'package:doc_app/utils/shared_pref_helper.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final url = ApiConstants.baseURL + ApiConstants.allSpecialization;
  ResponseModelSpecialization? responseBodySpecialization;
  SpecializationsData? specializationsData;
  void getAllSpecialization() async {
    final specializationResponse = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization":
          "Bearer ${await SharedPrefHelper.getSecuredString(ShardPrefKeys.userToken)}"
    });
    emit(HomeLoading());
    try {
      if (specializationResponse.statusCode == 200) {
        log(specializationResponse.body);
        final dataOfSpecialization =
            jsonDecode(specializationResponse.body) as Map<String, dynamic>;
        responseBodySpecialization =
            ResponseModelSpecialization.fromJson(dataOfSpecialization);
        log(specializationResponse.body);
        emit(HomeSuccess(
            responseBodySpecialization: responseBodySpecialization!));
      } else {
        log(specializationResponse.body);
        emit(HomeFailure());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
