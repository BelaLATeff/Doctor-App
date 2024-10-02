import 'package:doc_app/features/home/data/model/specializations_data.dart';
import 'package:doc_app/features/home/home_cubit/home_cubit.dart';
import 'package:doc_app/features/home/ui/widgets/specialty/specialty_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialtyListView extends StatefulWidget {
  const SpecialtyListView({super.key, required this.specializationsData});
  final List<SpecializationsData?> specializationsData;

  @override
  State<SpecialtyListView> createState() => _SpecialtyListViewState();
}

class _SpecialtyListViewState extends State<SpecialtyListView> {
  var selectedSocializationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        itemCount: widget.specializationsData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSocializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                  specializationId: widget.specializationsData[index]?.id);
            },
            child: SpecialtyListViewItem(
              specializationsData: widget.specializationsData[index],
              itemIndex: index,
              selectedIndex: selectedSocializationIndex,
            ),
          );
        },
      ),
    );
  }
}
