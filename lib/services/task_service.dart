import 'package:tasks/data/database_helper.dart';
import 'package:tasks/model/task.dart';

class TaskService {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> addTask(Task task) async {
    final db = await _databaseHelper.database;
    await db.insert('tasks', task.toMap());
  }

  Future<List<Task>> getTasks() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query("tasks");
    return List.generate(maps.length, (index) {
      return Task.fromMap(maps[index]);
    });
  }

  Future<void> updateTask(Task task) async {
    final db = await _databaseHelper.database;
    db.update(
      "tasks",
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(Task task) async {
    final db = await _databaseHelper.database;
    db.delete(
      "tasks",
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }
}
