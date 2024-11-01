import 'package:flutter/material.dart';

class CreateTaskDialog extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final Function(String) onSubmitted;

  CreateTaskDialog({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Create Task"),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: "Task Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            onSubmitted(controller.text);
          },
          child: const Text("Create"),
        ),
      ],
    );
  }
}
