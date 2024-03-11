import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/pages/home.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("tasksbox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black, fontFamily: 'Mali'),
      home: const HomePage(),
    );
  }
}
