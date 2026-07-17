import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences preferences;

  static const String key = 'seenOnboarding';

  static Future<void> init()async{
    preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> hasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<void> setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, true);
  }
}