import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool? taskCompleted;
  final Function(bool?)? onChanged;

  const TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black),
            Text(
              taskName,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  decoration:
                      taskCompleted! ? TextDecoration.lineThrough : null),
            ),
          ],
        ));
  }
}
