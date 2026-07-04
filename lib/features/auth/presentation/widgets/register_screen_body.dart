import 'package:auth_system/features/auth/presentation/screens/login_screen.dart';
import 'package:auth_system/features/auth/presentation/widgets/auth_navigation_text.dart';
import 'package:auth_system/features/auth/presentation/widgets/head_screen.dart';
import 'package:auth_system/features/auth/presentation/widgets/login_with_google.dart';
import 'package:auth_system/features/auth/presentation/widgets/register_form.dart';
import 'package:auth_system/features/auth/presentation/widgets/row_divider.dart';
import 'package:auth_system/features/auth/presentation/widgets/user_image.dart';
import 'package:flutter/material.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const HeadScreen(
            title: 'Create Account',
            subtitle:
                "Sign up now and start exploring all that our\napp has to offer. We're excited to welcome\nyou to our community!",
          ),
          const SizedBox(height: 15),
          UserImage(),
          const RegisterForm(),
          const SizedBox(height: 30),
          const RowDivider(text: "OR"),
          const SizedBox(height: 30),
          const LoginWithGoogle(),
          const SizedBox(height: 30),
          const AuthNavigationText(
            question: "Already have an account? ",
            action: "Login",
            navigateTo: LoginScreen(),
          ),
        ],
      ),
    );
  }
}
