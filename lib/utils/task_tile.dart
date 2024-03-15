import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {super.key,
      required this.title,
      required this.description,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction,
      required this.onTap});

  final String title;
  final String description;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(12),
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
          )
        ],
      ),
      child: Card(
        child: ListTile(
          leading: Checkbox(
              activeColor: Colors.black,
              checkColor: Colors.grey,
              value: taskCompleted,
              onChanged: onChanged),
          title: Text(
            title,
            style: TextStyle(
                color: const Color(0xffcccccc),
                fontStyle: taskCompleted ? FontStyle.italic : FontStyle.normal,
                decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
