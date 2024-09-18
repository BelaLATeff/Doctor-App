import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doc_app/data/models/home/doctor_data.dart';
import 'package:doc_app/data/models/home/response_model_specialization.dart';
import 'package:doc_app/data/models/home/specializations_data.dart';
import 'package:doc_app/data/web_services/api_constants.dart';
import 'package:doc_app/utils/constants.dart';
import 'package:doc_app/utils/extensions.dart';
import 'package:doc_app/utils/shared_pref_helper.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ResponseModelSpecialization? responseBodySpecialization;
  SpecializationsData? specializationsData;
  HomeCubit() : super(HomeInitial());

  final url = ApiConstants.baseURL + ApiConstants.allSpecialization;
  void getAllSpecialization() async {
    emit(HomeLoading());
    final specializationResponse = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization":
          "Bearer ${await SharedPrefHelper.getSecuredString(ShardPrefKeys.userToken)}"
    });
    try {
      if (specializationResponse.statusCode == 200) {
        // log(specializationResponse.body);
        final dataOfSpecialization =
            jsonDecode(specializationResponse.body) as Map<String, dynamic>;
        responseBodySpecialization =
            ResponseModelSpecialization.fromJson(dataOfSpecialization);
        log(specializationResponse.body);
        getDoctorsList(
            specializationId: responseBodySpecialization?.data?.first?.id);
        // emit(HomeSuccess(
        //     responseBodySpecialization: responseBodySpecialization!));
      } else {
        log(specializationResponse.body);
        emit(HomeFailure());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void getDoctorsList({required int? specializationId}) {
    List<DoctorsData?>? doctorsList =
        getDoctorsListBySpecializationId(specializationId);

    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeSuccess(doctorsList, responseBodySpecialization!));
    } else {
      emit(HomeFailure());
    }
  }

  /// returns the list of doctors based on the specialization id
  getDoctorsListBySpecializationId(specializationId) {
    return responseBodySpecialization?.data
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctors;
  }
}

class Doctors {}
