part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final ResponseModelSpecialization responseBodySpecialization;
  final List<DoctorsData?>? doctorsData;

  HomeSuccess(this.doctorsData, this.responseBodySpecialization);
}

final class HomeFailure extends HomeState {}
