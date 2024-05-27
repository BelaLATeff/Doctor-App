import 'doctor_app.dart';
import 'routes/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DoctorApp(
      appRouter: AppRouter(),
    ),
  );
}
