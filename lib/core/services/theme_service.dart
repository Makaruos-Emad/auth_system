import 'package:auth_system/core/services/shared_preferences_singleton.dart';
import 'package:flutter/material.dart';

class ThemeService {
  ThemeService._();

  static final ThemeService instance = ThemeService._();

  static const String _themePreferenceKey = 'is_dark_mode';

  final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(
    ThemeMode.light,
  );

  Future<void> init() async {
    final isDarkMode = Prefs.getBool(_themePreferenceKey);

    themeModeNotifier.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    themeModeNotifier.value = themeMode;

    await Prefs.setBool(_themePreferenceKey, themeMode == ThemeMode.dark);
  }
}
