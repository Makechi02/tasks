import 'package:flutter/material.dart';
import 'package:tasks/model/task.dart';

class TaskDetailsPage extends StatelessWidget {
  final Task task;

  TaskDetailsPage(this.task);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Title: ${task.title}"),
            Text(
                "Description: ${task.description.isEmpty ? 'No description yet!' : task.description}"),
            Text("Completed: ${task.isCompleted ? 'Yes' : 'No'}"),
          ],
        ),
      ),
    );
  }
}
