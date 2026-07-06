import 'package:auth_system/core/shared/widget/custom_button.dart';
import 'package:auth_system/core/shared/widget/custom_text_form_field.dart';
import 'package:auth_system/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:auth_system/features/auth/presentation/cubit/auth_state.dart';
import 'package:auth_system/features/auth/presentation/widgets/head_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreenBody extends StatefulWidget {
  const ForgotPasswordScreenBody({super.key});

  @override
  State<ForgotPasswordScreenBody> createState() =>
      _ForgotPasswordScreenBodyState();
}

class _ForgotPasswordScreenBodyState extends State<ForgotPasswordScreenBody> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.passwordResetSent) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Password reset email sent. Please check your inbox.',
              ),
            ),
          );
          Navigator.of(context).pop();
          return;
        }

        if (state.status == AuthStatus.error && state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
      builder: (context, state) {
        final isLoading = state.status == AuthStatus.loading;

        return SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  controller: _emailController,
                  prefixIcon: Icons.email,
                  hintText: 'name@company.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    final email = value.trim();
                    if (!RegExp(
                      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                    ).hasMatch(email)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: isLoading ? 'Sending...' : 'Reset Password',
                  isLoading: isLoading,
                  onPressed: isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().resetPassword(
                              email: _emailController.text.trim(),
                            );
                          }
                        },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
