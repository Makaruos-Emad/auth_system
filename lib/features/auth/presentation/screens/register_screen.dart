import 'package:auth_system/core/constants/app_const.dart';
import 'package:auth_system/features/auth/presentation/widgets/register_screen_body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: RegisterScreenBody(),
        ),
      ),
    );
  }
}
