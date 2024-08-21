import 'package:doc_app/data/models/home/specializations_data.dart';
import 'package:doc_app/theme/colors.dart';
import 'package:doc_app/theme/text_styles.dart';
import 'package:doc_app/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialtyListViewItem extends StatelessWidget {
  final SpecializationsData? specializationsData;
  final int itemIndex;
  final int selectedIndex;
  const SpecialtyListViewItem(
      {super.key,
      required this.itemIndex,
      this.specializationsData,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24),
      child: Column(
        children: [
          selectedIndex == itemIndex
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsManager.darkBlue,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 38.r,
                    backgroundColor: ColorsManager.lightBlue,
                    child: Image.asset(
                      "assets/images/specialization_doctor.png",
                      height: 45.h,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 35.r,
                  backgroundColor: ColorsManager.lightBlue,
                  child: Image.asset(
                    "assets/images/specialization_doctor.png",
                    height: 45.h,
                  ),
                ),
          heightSpace(10),
          Text(
            "${specializationsData?.name}",
            style: itemIndex == selectedIndex
                ? TextStyles.font14DarkBlueBold
                : TextStyles.font14DarkBlueRegular,
          )
        ],
      ),
    );
  }
}
