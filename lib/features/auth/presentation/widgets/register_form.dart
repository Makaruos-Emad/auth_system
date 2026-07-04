import 'package:auth_system/core/shared/widget/custom_button.dart';
import 'package:auth_system/core/shared/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

bool _isPasswordVisible = false;

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your Name", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        CustomTextFormField(
          prefixIcon: Icons.person,
          hintText: "Makaruos Emad",
        ),
        const SizedBox(height: 16),
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

        const SizedBox(height: 30),
        CustomButton(
          onPressed: () {
            // Handle registration logic here
          },
          text: "Submit",
        ),
      ],
    );
  }
}
