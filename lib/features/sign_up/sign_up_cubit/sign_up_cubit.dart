import 'package:bloc/bloc.dart';
import 'package:doc_app/features/sign_up/data/model/sign_up_request_body.dart';
import 'package:doc_app/features/sign_up/data/model/sign_up_response_body.dart';
import 'package:doc_app/features/sign_up/data/sign_up_repo/sign_up_repo.dart';
import 'package:flutter/material.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo signUpRepo;
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? phoneNumberController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();

  void emitSignUp(SignUpRequestBody signUpRequestBody) async {
    emit(SignUpLoading());

    try {
      final response = await signUpRepo.signUpRequest(signUpRequestBody);
      emit(SignUpSuccess(signUpResponseBody: response));
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
}
