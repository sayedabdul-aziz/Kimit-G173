import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_3_19/core/services/local_storage.dart';
import 'package:taskati_3_19/features/splash_view.dart';

// add hive and hive_flutter into pubspec.
// init hive in main()
// open your box with name
// get your box in views to dealing with it
// put(key,value) and delete(key) , get(key)

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('user');
  AppLocalStorage().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
