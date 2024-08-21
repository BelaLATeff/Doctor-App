import 'package:doc_app/modules/home/widgets/container_doctor.dart';
import 'package:doc_app/modules/home/widgets/doctor/doctor_bloc_builder.dart';
import 'package:doc_app/modules/home/widgets/doctors_speciality_see_all.dart';
import 'package:doc_app/modules/home/widgets/specialty/specialty_bloc_builder.dart';
import 'package:doc_app/modules/home/widgets/home_top_bar.dart';
import 'package:doc_app/utils/spacer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const ContainerDoctor(),
              heightSpace(16),
              const DoctorsSpecialtySeeAll(),
              heightSpace(18),
              const SpecialtyBLocBuilder(),
              heightSpace(16),
              const DoctorBlocBuilder()
            ],
          ),
        ),
      ),
    );
  }
}
