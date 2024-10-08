part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final SignUpResponseBody signUpResponseBody;

  SignUpSuccess({required this.signUpResponseBody});
}

final class SignUpFailure extends SignUpState {
  final String massage;

  SignUpFailure(this.massage);
}
