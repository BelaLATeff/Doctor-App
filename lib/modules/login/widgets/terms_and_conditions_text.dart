import '../../../theme/text_styles.dart';
import 'package:flutter/cupertino.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "By Loggin, you agree to our",
            style: TextStyles.font14GrayRegular,
          ),
          TextSpan(
            text: "  Terms & Conditions",
            style: TextStyles.font14DarkBlueMedium,
          ),
          TextSpan(
            text: "   and",
            style: TextStyles.font14GrayRegular,
          ),
          TextSpan(
            text: "  Privacy Policy",
            style: TextStyles.font14DarkBlueMedium.copyWith(height: 1.5),
          ),
        ],
      ),
    );
  }
}
