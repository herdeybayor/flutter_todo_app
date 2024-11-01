import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final String taskName;
  final bool? taskCompleted;
  final Function(bool?)? onChanged;

  const TodoTile({super.key, required this.taskName, required this.taskCompleted, required this.onChanged});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(
                  value: widget.taskCompleted,
                  onChanged: (value) {
                    setState(() {
                      widget.onChanged!(value);
                    });
                  }),
              Text(widget.taskName),
            ],
          ));
  }
}
