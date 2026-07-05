import 'package:auth_system/core/shared/widget/custom_button.dart';
import 'package:auth_system/core/shared/widget/custom_text_form_field.dart';
import 'package:auth_system/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:auth_system/features/auth/presentation/cubit/auth_state.dart';
import 'package:auth_system/features/auth/presentation/widgets/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? "Unknown Error")),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email", style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: emailController,
                prefixIcon: Icons.email,
                hintText: "name@company.com",
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your email";
                  }
                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if (!emailRegex.hasMatch(value.trim())) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Text("Password", style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: passwordController,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }

                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 8),
              ForgotPassword(),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                  }
                },
                text: state.status == AuthStatus.loading
                    ? "Loading..."
                    : "Login",
              ),
            ],
          ),
        );
      },
    );
  }
}
