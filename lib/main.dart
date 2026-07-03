import 'package:auth_system/core/theme/app_theme.dart';
import 'package:auth_system/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AuthSystem());
}

class AuthSystem extends StatelessWidget {
  const AuthSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth System',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: LoginScreen(),
    );
  }
}
