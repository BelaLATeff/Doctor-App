import 'dart:developer';

import 'package:doc_app/features/home/home_cubit/home_cubit.dart';
import 'package:doc_app/features/home/ui/widgets/doctor/doctor_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorBlocBuilder extends StatelessWidget {
  const DoctorBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          return DoctorListView(doctorsList: state.doctorsData);
        } else if (state is HomeFailure) {
          log("Some Think Error");
        }
        return const SizedBox.shrink();
      },
    );
  }
}
