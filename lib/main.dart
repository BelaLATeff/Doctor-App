import 'package:bloc/bloc.dart';
import 'package:doc_app/utils/constants.dart';
import 'package:doc_app/utils/extensions.dart';
import 'package:doc_app/utils/my_bloc_observer.dart';
import 'package:doc_app/utils/shared_pref_helper.dart';

import 'doctor_app.dart';
import 'routes/app_router.dart';
import 'package:flutter/material.dart';

bool isLoggedIn = false;
void main() async {
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
