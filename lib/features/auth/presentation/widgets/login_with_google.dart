import 'package:auth_system/core/shared/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      icon: CircleAvatar(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SvgPicture.asset('assets/icons/google_icon.svg'),
        ),
      ),
      text: "Continue with Google",
      onPressed: () {},
    );
  }
}
