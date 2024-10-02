import 'package:doc_app/features/home/data/home_repo/home_repo.dart';
import 'package:doc_app/features/home/home_cubit/home_cubit.dart';
import 'package:doc_app/features/login/data/login_repo/login_repo.dart';
import 'package:doc_app/features/login/login_cubit/login_cubit.dart';
import 'package:doc_app/features/sign_up/data/sign_up_repo/sign_up_repo.dart';
import 'package:doc_app/features/sign_up/sign_up_cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  //Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo());
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //SignUp
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo());
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // Home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
