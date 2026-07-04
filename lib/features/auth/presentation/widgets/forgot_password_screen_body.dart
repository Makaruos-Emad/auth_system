import 'package:auth_system/core/shared/widget/custom_button.dart';
import 'package:auth_system/core/shared/widget/custom_text_form_field.dart';
import 'package:auth_system/features/auth/presentation/widgets/head_screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreenBody extends StatefulWidget {
  const ForgotPasswordScreenBody({super.key});

  @override
  State<ForgotPasswordScreenBody> createState() =>
      _ForgotPasswordScreenBodyState();
}

class _ForgotPasswordScreenBodyState extends State<ForgotPasswordScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeadScreen(
            title: 'Forgot Password',
            subtitle: 'Enter your email address\nto reset your password.',
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Email", style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            prefixIcon: Icons.email,
            hintText: "name@company.com",
          ),
          const SizedBox(height: 30),
          CustomButton(text: "Reset Password", onPressed: () {}),
        ],
      ),
    );
  }
}
