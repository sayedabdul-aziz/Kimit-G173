import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static late SharedPreferences _sharedPreferences;
  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static cacheData(key, value) {
    _sharedPreferences.setString(key, value);
  }

  static getCachedData(key) {
    return _sharedPreferences.getString(key);
  }
}
