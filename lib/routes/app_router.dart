import 'package:doc_app/modules/register/cubit_register/register_cubit.dart';
import 'package:doc_app/modules/register/register.dart';

import '../data/models/login/login_response_body.dart';
import '../modules/home/home_screen.dart';
import '../modules/login/cubit_Login/login_cubit.dart';
import '../modules/login/login.dart';
import '../modules/onboard/onboard.dart';
import 'routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter extends Route {
  Route generatorRoute(RouteSettings settings) {
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
        final userData = (settings.arguments ?? UserData()) as UserData;
        return MaterialPageRoute(
          builder: (context) => HomeScreen(userData: userData),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (BuildContext context) => RegisterCubit(),
            child: const RegisterScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No Rout Defined For ${settings.name}"),
            ),
          ),
        );
    }
  }
}
