part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final ResponseModelSpecialization responseBodySpecialization;
  final List<DoctorsData?>? doctorsData;

  HomeSuccess(this.responseBodySpecialization, this.doctorsData);
}

final class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);
}
