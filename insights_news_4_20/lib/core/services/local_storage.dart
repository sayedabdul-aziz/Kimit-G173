import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static late SharedPreferences prefs;
  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static cacheData(String key, value) async {
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else {
      await prefs.setStringList(key, value);
    }
  }

  static getCachedData(String key) {
    return prefs.get(key);
  }
}
