import 'package:doc_app/core/routes/app_router.dart';
import 'package:doc_app/core/routes/routes.dart';
import 'package:doc_app/core/theme/colors.dart';
import 'package:doc_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: GetMaterialApp(
        title: "Doctor App",
        debugShowCheckedModeBanner: false,
        initialRoute: isLoggedIn ? Routes.home : Routes.onBoarding,
        onGenerateRoute: appRouter.generatorRoute,
        theme: ThemeData(
          primaryColor: ColorsManager.mainColor,
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
