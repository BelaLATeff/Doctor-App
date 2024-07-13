import 'package:doc_app/data/models/home/doctor_data.dart';
import 'package:doc_app/theme/text_styles.dart';
import 'package:doc_app/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationDoctor extends StatelessWidget {
  final List<DoctorsData?> doctorsData;
  const RecommendationDoctor({super.key, required this.doctorsData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 16.h,
        ),
        itemCount: doctorsData.length,
        itemBuilder: (context, index) => Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(
                "https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg?crop=0.66698xw:1xh;center,top&resize=640:*",
                height: 120.h,
                width: 110.w,
                fit: BoxFit.fill,
              ),
            ),
            widthSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${doctorsData[index]!.name}",
                    style: TextStyles.font16DarkBlueBold,
                  ),
                  heightSpace(8),
                  Text(
                    "${doctorsData[index]!.degree}  |  ${doctorsData[index]!.phone}",
                    style: TextStyles.font14DGrayMedium,
                  ),
                  heightSpace(8),
                  Text(
                    "${doctorsData[index]!.email}",
                    style: TextStyles.font14DGrayMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
