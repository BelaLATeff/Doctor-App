import 'package:doc_app/modules/home/home_cubit/home_cubit.dart';
import 'package:doc_app/modules/sign_up/sign_up_cubit/sign_up_cubit.dart';
import 'package:doc_app/modules/sign_up/sign_up.dart';
import '../modules/home/home_screen.dart';
import '../modules/login/login_cubit/login_cubit.dart';
import '../modules/login/login.dart';
import '../modules/onboard/onboard.dart';
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
            create: (BuildContext context) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );

      case Routes.home:
        // final userData = (settings.arguments ?? UserData()) as UserData;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit()..getAllSpecialization(),
            child: const HomeScreen(),
            // child: HomeScreen(userData: userData),
          ),
        );

      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignUpCubit(),
            child: const SignUpScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
