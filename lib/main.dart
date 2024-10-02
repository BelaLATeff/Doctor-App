import 'package:bloc/bloc.dart';
import 'package:doc_app/core/dependency_injection/di.dart';
import 'package:doc_app/core/routes/app_router.dart';
import 'package:doc_app/core/utils/constants.dart';
import 'package:doc_app/core/utils/extensions.dart';
import 'package:doc_app/core/utils/my_bloc_observer.dart';
import 'package:doc_app/core/utils/shared_pref_helper.dart';

import 'doctor_app.dart';
import 'package:flutter/material.dart';

bool isLoggedIn = false;
void main() async {
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await checkIfUserLoggedIn();
  Bloc.observer = MyBlocObserver();
  runApp(
    DoctorApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfUserLoggedIn() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(ShardPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
  }
}
