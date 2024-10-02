import 'package:bloc/bloc.dart';
import 'package:doc_app/core/utils/extensions.dart';
import 'package:doc_app/features/home/data/home_repo/home_repo.dart';
import 'package:doc_app/features/home/data/model/doctor_data.dart';
import 'package:doc_app/features/home/data/model/response_model_specialization.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  ResponseModelSpecialization? responseBodySpecialization;

  HomeCubit(this._homeRepo) : super(HomeInitial());

  void emitHomeState() async {
    emit(HomeLoading());
    responseBodySpecialization = await _homeRepo.getAllSpecialization();
    getDoctorsList(
        specializationId: responseBodySpecialization?.data?.first?.id);
  }

  void getDoctorsList({required int? specializationId}) async {
    List<DoctorsData?>? doctorsList =
        getDoctorsListBySpecializationId(specializationId);
    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeSuccess(responseBodySpecialization!, doctorsList));
    } else {
      emit(HomeFailure("No doctors found for this specialty"));
    }
  }

  /// returns the list of doctors based on the specialization id
  getDoctorsListBySpecializationId(specializationId) {
    return responseBodySpecialization?.data
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctors;
  }
}
