import 'package:auth_system/features/auth/presentation/screens/register_screen.dart';
import 'package:auth_system/features/auth/presentation/widgets/head_screen.dart';
import 'package:auth_system/features/auth/presentation/widgets/login_form.dart';
import 'package:auth_system/features/auth/presentation/widgets/login_with_google.dart';
import 'package:auth_system/features/auth/presentation/widgets/row_divider.dart';
import 'package:auth_system/features/auth/presentation/widgets/auth_navigation_text.dart';
import 'package:flutter/material.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const HeadScreen(
            title: 'Welcome Back',
            subtitle:
                'Sign in to SecureVault to manage\nyour encrypted digital assets.',
          ),
          const SizedBox(height: 30),
          const LoginForm(),
          const SizedBox(height: 30),
          const RowDivider(text: "OR"),
          const SizedBox(height: 30),
          const LoginWithGoogle(),
          const SizedBox(height: 30),
          const AuthNavigationText(
            question: 'new here? ',
            action: 'Create Account',
            navigateTo: RegisterScreen(),
          ),
        ],
      ),
    );
  }
}
