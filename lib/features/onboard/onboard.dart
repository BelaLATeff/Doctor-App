import 'package:doc_app/core/routes/routes.dart';
import 'package:doc_app/core/theme/text_button.dart';
import 'package:doc_app/core/theme/text_styles.dart';
import 'package:doc_app/core/utils/extensions.dart';
import 'package:doc_app/core/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30.h,
              bottom: 30.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svgs/doc_logo.svg"),
                    widthSpace(8),
                    Text(
                      "Doctor",
                      style: TextStyles.font24BlackRegular,
                    ),
                  ],
                ),
                heightSpace(30),
                Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/doc_low_opacity.svg",
                    ),
                    Container(
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0.0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: const [0.14, 0.4],
                        ),
                      ),
                      child: Image.asset("assets/images/doctor.png"),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,
                      child: Text(
                        "Best Doctor\nAppointment App",
                        textAlign: TextAlign.center,
                        style: TextStyles.font32BlueBold.copyWith(
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Text(
                        "Manage and schedule all of your medical appointments easily with Doctor to get a new experience.",
                        textAlign: TextAlign.center,
                        style: TextStyles.font14GrayBold,
                      ),
                      heightSpace(30),
                      AppTextButton(
                        onPressed: () {
                          context.pushNamed(Routes.login);
                        },
                        buttonText: "Get Started",
                        textStyle: TextStyles.font16WhiteSemiBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
