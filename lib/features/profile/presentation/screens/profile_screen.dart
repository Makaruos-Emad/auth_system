import 'package:auth_system/core/constants/app_const.dart';
import 'package:auth_system/features/profile/presentation/widget/profile_screen_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: ProfileScreenBody(),
        ),
      ),
    );
  }
}
