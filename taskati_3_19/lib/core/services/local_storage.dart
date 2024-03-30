import 'package:hive/hive.dart';
import 'package:taskati_3_19/features/add-task/model/task_model.dart';

class AppLocalStorage {
  static late Box userBox;
  static late Box<TaskModel> taskBox;

  init() {
    userBox = Hive.box('user');
    taskBox = Hive.box<TaskModel>('task');
  }

  static cacheData(key, value) {
    userBox.put(key, value);
  }

  static getCachedData(key) {
    return userBox.get(key);
  }

  static cacheTask(key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel getTask(key) {
    return taskBox.get(key)!;
  }
}
