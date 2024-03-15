import 'package:flutter/material.dart';
import 'package:tasks/data/database_helper.dart';
import 'package:tasks/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().database;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black87,
          fontFamily: 'Mali',
          brightness: Brightness.dark),
      home: const HomePage(),
    );
  }
}
