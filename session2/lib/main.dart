import 'package:flutter/material.dart';
import 'package:session2/counter/counter_view2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterStatefulView(),
    );
  }
}
