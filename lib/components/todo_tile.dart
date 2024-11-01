import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final String taskName;

  const TodoTile({super.key, required this.taskName});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(
                  value: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  }),
              // TODO: Update Task Name
              Text(widget.taskName),
            ],
          ));
  }
}
