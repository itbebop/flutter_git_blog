import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static final Prefs _instance = Prefs._internal();
  static SharedPreferences? _prefs;

  factory Prefs() {
    return _instance;
  }

  Prefs._internal();

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception("Prefs not initialized. Call Prefs.init() before accessing.");
    }
    return _prefs!;
  }
}
