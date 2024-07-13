import 'package:doc_app/data/models/home/specializations_data.dart';
import 'package:doc_app/theme/colors.dart';
import 'package:doc_app/theme/text_styles.dart';
import 'package:doc_app/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialty extends StatelessWidget {
  const DoctorSpecialty({super.key, required this.specializationsData});
  final List<SpecializationsData?> specializationsData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Doctor Specialty",
              style: TextStyles.font18DarkBlueSemiBold,
            ),
            const Spacer(),
            Text(
              "See All",
              style: TextStyles.font14BlueRegular,
            ),
          ],
        ),
        heightSpace(16),
        SizedBox(
          height: 120.h,
          child: ListView.builder(
            itemCount: specializationsData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35.r,
                      backgroundColor: ColorsManager.lightBlue,
                      child: Image.asset(
                        "assets/images/specialization_doctor.png",
                        height: 45.h,
                      ),
                    ),
                    heightSpace(10),
                    Text("${specializationsData[index]!.name}")
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
