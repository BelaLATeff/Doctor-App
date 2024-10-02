import 'package:doc_app/core/dependency_injection/di.dart';
import 'package:doc_app/features/home/home_cubit/home_cubit.dart';
import 'package:doc_app/features/home/ui/home_screen.dart';
import 'package:doc_app/features/login/login_cubit/login_cubit.dart';
import 'package:doc_app/features/login/ui/login.dart';
import 'package:doc_app/features/onboard/onboard.dart';
import 'package:doc_app/features/sign_up/sign_up_cubit/sign_up_cubit.dart';
import 'package:doc_app/features/sign_up/ui/sign_up.dart';
import 'routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter extends Route {
  Route? generatorRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardScreen(),
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => LoginCubit(getIt()),
            child: const LoginScreen(),
          ),
        );

      case Routes.home:
        // final userData = (settings.arguments ?? UserData()) as UserData;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(getIt())..emitHomeState(),
            child: const HomeScreen(),
            // child: HomeScreen(userData: userData),
          ),
        );

      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignUpCubit(getIt()),
            child: const SignUpScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
