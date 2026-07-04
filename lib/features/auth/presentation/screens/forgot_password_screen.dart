import 'package:auth_system/core/constants/app_const.dart';
import 'package:auth_system/features/auth/presentation/widgets/forgot_password_screen_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: ForgotPasswordScreenBody(),
        ),
      ),
    );
  }
}
