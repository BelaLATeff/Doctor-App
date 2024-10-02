import 'package:doc_app/core/theme/colors.dart';
import 'package:doc_app/core/theme/text_styles.dart';
import 'package:doc_app/core/utils/constants.dart';
import 'package:doc_app/core/utils/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeTopBar extends StatefulWidget {
  const HomeTopBar({super.key});

  @override
  State<HomeTopBar> createState() => _HomeTopBarState();
}

class _HomeTopBarState extends State<HomeTopBar> {
  String userName = "";
  @override
  void initState() {
    super.initState();
    getName();
  }

  void getName() async {
    userName = await SharedPrefHelper.getString(ShardPrefKeys.userName);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Hi, $userName",
              style: TextStyles.font18DarkBlueBold,
            ),
            const Spacer(),
            CircleAvatar(
              radius: 24.r,
              backgroundColor: ColorsManager.moreLighterGrey,
              child: SvgPicture.asset("assets/svgs/button.svg"),
            ),
          ],
        ),
        Text(
          "How Are you Today?",
          style: TextStyles.font12DarkGrayRegular,
        ),
      ],
    );
  }
}
