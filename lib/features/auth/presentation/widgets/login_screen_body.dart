import 'package:auth_system/features/auth/presentation/widgets/login_form.dart';
import 'package:auth_system/features/auth/presentation/widgets/login_with_google.dart';
import 'package:auth_system/features/auth/presentation/widgets/row_divider.dart';
import 'package:flutter/material.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Text(
            "Welcome Back",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            "Sign in to SecureVault to manage\nyour encrypted digital assets.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 30),
          const LoginForm(),
          const SizedBox(height: 30),
          RowDivider(text: "OR"),
          const SizedBox(height: 30),
          const LoginWithGoogle(),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("New here? ", style: Theme.of(context).textTheme.labelLarge),
              Text(
                "Create Account",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
