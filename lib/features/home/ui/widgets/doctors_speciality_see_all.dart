import 'package:doc_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class DoctorsSpecialtySeeAll extends StatelessWidget {
  const DoctorsSpecialtySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
