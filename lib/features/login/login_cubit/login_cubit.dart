import 'package:doc_app/features/login/data/login_repo/login_repo.dart';
import 'package:doc_app/features/login/data/model/login_request_body.dart';
import 'package:doc_app/features/login/data/model/login_response_body.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  void emitLogin(LoginRequestBody loginRequestBody) async {
    emit(LoginLoading());
    try {
      final response = await loginRepo.loginRequest(loginRequestBody);
      emit(LoginSuccess(loginResponseBody: response));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
