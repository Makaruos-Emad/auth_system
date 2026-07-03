import 'package:auth_system/core/shared/widget/custom_button.dart';
import 'package:auth_system/core/shared/widget/custom_text_form_field.dart';
import 'package:auth_system/features/auth/presentation/widgets/forgot_password.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

bool _isPasswordVisible = false;

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        CustomTextFormField(
          prefixIcon: Icons.email,
          hintText: "name@company.com",
        ),
        const SizedBox(height: 16),
        Text("Password", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        CustomTextFormField(
          prefixIcon: Icons.lock,
          hintText: "........",
          obscureText: _isPasswordVisible,
          suffixIcon: _isPasswordVisible
              ? Icons.visibility
              : Icons.visibility_off,
          onSuffixPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        const SizedBox(height: 8),
        ForgotPassword(),
        const SizedBox(height: 30),
        CustomButton(
          onPressed: () {
            // Handle login logic here
          },
          text: "Login",
        ),
      ],
    );
  }
}
