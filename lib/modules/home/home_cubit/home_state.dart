part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final ResponseModelSpecialization responseBodySpecialization;

  HomeSuccess({required this.responseBodySpecialization});
}

final class HomeFailure extends HomeState {}
