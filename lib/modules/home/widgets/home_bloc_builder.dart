import 'dart:developer';

import 'package:doc_app/data/models/home/specializations_data.dart';
import 'package:doc_app/modules/home/home_cubit/home_cubit.dart';
import 'package:doc_app/modules/home/widgets/doctor_specialty.dart';
import 'package:doc_app/modules/home/widgets/recommendation_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBLocBuilder extends StatefulWidget {
  const HomeBLocBuilder({super.key});

  @override
  State<HomeBLocBuilder> createState() => _HomeBLocBuilderState();
}

class _HomeBLocBuilderState extends State<HomeBLocBuilder> {
  List<SpecializationsData?>? specializationsData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const SizedBox(
            height: 120,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is HomeSuccess) {
          specializationsData = (state).responseBodySpecialization.data;
          return Expanded(
            child: Column(
              children: [
                DoctorSpecialty(
                  specializationsData: specializationsData ?? [],
                ),
                RecommendationDoctor(
                  doctorsData: specializationsData!.first!.doctors ?? [],
                ),
              ],
            ),
          );
        } else if (state is HomeFailure) {
          log("Some Think is Error");
        }
        return const SizedBox.shrink();
      },
    );
  }
}
