import 'package:doc_app/core/theme/text_styles.dart';
import 'package:doc_app/core/utils/spacer.dart';
import 'package:doc_app/features/home/data/model/doctor_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListViewItem extends StatelessWidget {
  final DoctorsData? doctorsData;
  const DoctorListViewItem({super.key, this.doctorsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
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
                  "${doctorsData?.name}",
                  style: TextStyles.font16DarkBlueBold,
                ),
                heightSpace(8),
                Text(
                  "${doctorsData?.degree}  |  ${doctorsData?.phone}",
                  style: TextStyles.font14DGrayMedium,
                ),
                heightSpace(8),
                Text(
                  "${doctorsData?.email}",
                  style: TextStyles.font14DGrayMedium,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
