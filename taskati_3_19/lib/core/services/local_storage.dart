import 'package:hive/hive.dart';

class AppLocalStorage {
  static late Box userBox;
  init() {
    userBox = Hive.box('user');
  }

  static cacheData(key, value) {
    userBox.put(key, value);
  }

  static String getCachedData(key) {
    return userBox.get(key);
  }
}
