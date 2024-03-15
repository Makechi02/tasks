import 'package:flutter/material.dart';
import 'package:tasks/model/task.dart';
import 'package:tasks/pages/task_details.dart';
import 'package:tasks/services/task_service.dart';
import 'package:tasks/utils/add_task_field.dart';
import 'package:tasks/utils/task_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<StatefulWidget> createState() => _TaskListState();
}

class _TaskListState extends State<TasksList> {
  final _controller = TextEditingController();
  final TaskService _taskService = TaskService();

  void addTask(String taskName) {
    setState(() {
      _taskService
          .addTask(Task(title: taskName, description: "", isCompleted: false));
    });
    _controller.clear();
    final snackbar = SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(milliseconds: 3000),
        behavior: SnackBarBehavior.floating,
        content: const Text("Task added successfully"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void checkBoxChanged(bool? value, Task task) {
    setState(() {
      task.isCompleted = value!;
      _taskService.updateTask(task);
    });
  }

  void undoDelete(Task task) {
    _taskService.addTask(task);
    setState(() {});
  }

  void deleteTask(Task task) {
    setState(() {
      _taskService.deleteTask(task);
    });
    final snackbar = SnackBar(
        action: SnackBarAction(
          label: "UNDO",
          textColor: Colors.orange.shade900,
          onPressed: () => undoDelete(task),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(milliseconds: 3000),
        behavior: SnackBarBehavior.floating,
        content: const Text("Task deleted"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTaskField(
          controller: _controller,
          addTask: (task) => addTask(task),
        ),
        Expanded(
            child: FutureBuilder<List<Task>>(
          future: _taskService.getTasks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else {
              final tasks = snapshot.data ?? [];
              return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return TaskTile(
                      title: task.title,
                      description: task.description,
                      taskCompleted: task.isCompleted,
                      onChanged: (value) => checkBoxChanged(value, task),
                      deleteFunction: (context) => deleteTask(task),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaskDetailsPage(task)),
                        );
                      },
                    );
                  });
            }
          },
        ))
      ],
    );
  }
}
