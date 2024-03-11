import 'package:hive_flutter/hive_flutter.dart';

class TasksDatabase {
  List tasksList = [];

  final _box = Hive.box("tasksbox");

  void createInitialData() {
    tasksList = [
      ["Makechi Eric", false],
      ["Create an android app", false]
    ];
  }

  void loadData() {
    tasksList = _box.get("TASKS");
  }

  void updateDatabase() {
    _box.put("TASKS", tasksList);
  }
}
