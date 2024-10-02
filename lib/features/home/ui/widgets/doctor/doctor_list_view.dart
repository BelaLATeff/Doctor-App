import 'package:doc_app/features/home/data/model/doctor_data.dart';
import 'package:doc_app/features/home/ui/widgets/doctor/doctor_list_view_item.dart';
import 'package:flutter/material.dart';

class DoctorListView extends StatelessWidget {
  final List<DoctorsData?>? doctorsList;
  const DoctorListView({super.key, this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: doctorsList?.length,
          itemBuilder: (context, index) {
            return DoctorListViewItem(doctorsData: doctorsList?[index]);
          }),
    );
  }
}
