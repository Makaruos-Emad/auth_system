import 'package:auth_system/core/constants/app_const.dart';
import 'package:auth_system/features/auth/presentation/widgets/login_screen_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: LoginScreenBody(),
        ),
      ),
    );
  }
}
