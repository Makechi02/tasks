import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/data/database.dart';
import 'package:tasks/utils/add_task_field.dart';
import 'package:tasks/utils/task.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<StatefulWidget> createState() => _TaskListState();
}

class _TaskListState extends State<TasksList> {
  final _controller = TextEditingController();
  final _box = Hive.box('tasksbox');

  TasksDatabase database = TasksDatabase();

  void addTask(String taskName) {
    setState(() {
      database.tasksList.add([taskName, false]);
    });
    _controller.clear();
    database.updateDatabase();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      database.tasksList[index][1] = !database.tasksList[index][1];
    });
    database.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      database.tasksList.removeAt(index);
    });
    database.updateDatabase();
  }

  @override
  void initState() {
    if (_box.get("TASKS") == null) {
      database.createInitialData();
    } else {
      database.loadData();
    }
    super.initState();
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
          child: ListView.builder(
            itemCount: database.tasksList.length,
            itemBuilder: (content, index) {
              return Column(
                children: [
                  Task(
                      taskName: database.tasksList[index][0],
                      taskCompleted: database.tasksList[index][1],
                      onChanged: (value) => checkBoxChanged(value, index),
                      deleteFunction: (context) => deleteTask(index)),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    color: Colors.grey[300],
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
