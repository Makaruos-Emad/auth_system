import 'package:auth_system/core/constants/supabase_keys.dart';
import 'package:auth_system/core/services/service_locator.dart';
import 'package:auth_system/core/services/shared_preferences_singleton.dart';
import 'package:auth_system/core/services/theme_service.dart';
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

  await Prefs.init();
  setupServiceLocator();
  await ThemeService.instance.init();

  runApp(const AuthSystem());
}

class AuthSystem extends StatelessWidget {
  const AuthSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<AuthCubit>())],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: ThemeService.instance.themeModeNotifier,
        builder: (context, themeMode, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Auth System',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            home: const AuthGate(),
          );
        },
      ),
    );
  }
}
