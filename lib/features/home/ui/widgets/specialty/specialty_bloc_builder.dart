import 'dart:developer';

import 'package:doc_app/features/home/data/model/specializations_data.dart';
import 'package:doc_app/features/home/home_cubit/home_cubit.dart';
import 'package:doc_app/features/home/ui/widgets/specialty/specialty_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialtyBLocBuilder extends StatefulWidget {
  const SpecialtyBLocBuilder({super.key});

  @override
  State<SpecialtyBLocBuilder> createState() => _SpecialtyBLocBuilderState();
}

class _SpecialtyBLocBuilderState extends State<SpecialtyBLocBuilder> {
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
          return SpecialtyListView(
            specializationsData: specializationsData ?? [],
          );
        } else if (state is HomeFailure) {
          log("Some Think is Error");
        }
        return const SizedBox.shrink();
      },
    );
  }
}
