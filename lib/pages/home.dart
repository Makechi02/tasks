import 'package:flutter/material.dart';
import 'package:tasks/utils/tasks_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const TasksList(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.black87,
      centerTitle: true,
      title: const Text(
        "TASKS",
        style: TextStyle(
            fontWeight: FontWeight.w900, fontSize: 26, color: Colors.white),
      ),
    );
  }
}
