import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Task extends StatelessWidget {
  Task(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
          )
        ],
      ),
      child: ListTile(
        leading: Checkbox(
            activeColor: Colors.black,
            value: taskCompleted,
            onChanged: onChanged),
        title: Text(
          taskName,
          style: TextStyle(
              fontStyle: taskCompleted ? FontStyle.italic : FontStyle.normal,
              decoration: taskCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
      ),
    );
  }
}
