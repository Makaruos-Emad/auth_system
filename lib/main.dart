import 'package:auth_system/core/constants/supabase_keys.dart';
import 'package:auth_system/core/services/service_locator.dart';
import 'package:auth_system/core/theme/app_theme.dart';
import 'package:auth_system/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:auth_system/features/auth/presentation/screens/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SupabaseKeys.supabaseUrl,
    publishableKey: SupabaseKeys.supabasePublishableKey,
  );
  setupServiceLocator();

  runApp(const AuthSystem());
}

class AuthSystem extends StatelessWidget {
  const AuthSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<AuthCubit>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Auth System',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        home: const AuthGate(),
      ),
    );
  }
}
