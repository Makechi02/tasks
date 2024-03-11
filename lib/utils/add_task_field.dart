import 'package:flutter/material.dart';

class AddTaskField extends StatelessWidget {
  AddTaskField({
    super.key,
    this.controller,
    required this.addTask
  });

  final controller;
  Function(String)? addTask;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: "What is your main focus for today?",
            // hintStyle: TextStyle(
            //   color: Colors.grey
            // )
          ),
          onSubmitted: addTask,
        )
    );
  }
}