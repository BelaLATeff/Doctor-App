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
  HomeCubit() : super(HomeInitial());

  final url = ApiConstants.baseURL + ApiConstants.allSpecialization;
  ResponseModelSpecialization? responseBodySpecialization;
  SpecializationsData? specializationsData;
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
        getDoctorsList(
            specializationId: responseBodySpecialization?.data?.first?.id);
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

  void getDoctorsList({required int? specializationId}) {
    List<DoctorsData?>? doctorList =
        getDoctorsListSpeciationId(specializationId);
    if (!doctorList.isNullOrEmpty()) {
      emit(DoctorSuccuss(doctorsData: doctorList));
    } else {
      log("Doctors Not Found");
      emit(DoctorFailure());
    }
  }

  getDoctorsListSpeciationId(specializationId) {
    return responseBodySpecialization?.data
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctors;
  }
}
