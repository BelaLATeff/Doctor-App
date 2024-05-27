import '../../data/models/login/login_response_body.dart';
import '../../theme/text_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.userData,
  });
  final UserData userData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "HI, ${userData.username!.toUpperCase()}",
          style: TextStyles.font24BlueBold,
        ),
      ),
    );
  }
}
