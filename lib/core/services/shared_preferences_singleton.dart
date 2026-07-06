import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool(String key, bool value) async {
    _instance ??= await SharedPreferences.getInstance();
    return _instance!.setBool(key, value);
  }

  static bool getBool(String key) {
    return _instance?.getBool(key) ?? false;
  }
}
