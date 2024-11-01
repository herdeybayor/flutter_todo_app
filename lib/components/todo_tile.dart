import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool? taskCompleted;
  final Function(bool?)? onChanged;
  final Function() deleteTask;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onChanged!(!taskCompleted!),
            icon: taskCompleted! ? Icons.undo : Icons.done,
            backgroundColor: taskCompleted! ? Colors.green : Colors.blue,
            foregroundColor: Colors.white,
          ),
          SlidableAction(
            onPressed: (context) => deleteTask(),
            icon: Icons.delete,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            borderRadius: const BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
          ),
        ],
      ),
      child: Container(
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
          )),
    );
  }
}
