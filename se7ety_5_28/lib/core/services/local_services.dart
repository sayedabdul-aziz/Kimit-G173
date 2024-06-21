import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static setData(String key, value) {
    if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else {
      _preferences.setString(key, value);
    }
  }

  static getData(String key) {
    return _preferences.get(key);
  }
}
