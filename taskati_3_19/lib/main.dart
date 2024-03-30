import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_3_19/core/services/local_storage.dart';
import 'package:taskati_3_19/core/themes/app_theme.dart';
import 'package:taskati_3_19/features/add-task/model/task_model.dart';
import 'package:taskati_3_19/features/splash_view.dart';

// add hive and hive_flutter into pubspec.
// init hive in main()
// open your box with name
// get your box in views to dealing with it
// put(key,value) and delete(key) , get(key)

//--------------------------
// add your class model
// add hive_generator and build_runner
// annote your class with @HiveType and its fields with @HiveField
// run: 'dart run build_runner build'
// generate type adapter
// register Adapter
// open your box with name
// get your box in views to dealing with it
// put(key,value) and delete(key) , get(key)

//----------------------------
// handle light and drak theme
// make button to change theme and cache it
// listen in matrial app

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox('user');
  await Hive.openBox<TaskModel>('task');
  AppLocalStorage().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      home: const SplashView(),
    );
  }
}
