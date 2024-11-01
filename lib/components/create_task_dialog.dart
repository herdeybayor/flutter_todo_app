import 'package:flutter/material.dart';
import 'package:todo_app/components/button.dart';

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
      actionsPadding: const EdgeInsets.all(16),
      actions: [
        Button(
          text: "Cancel",
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Button(
          text: "Create",
          onPressed: () {
            onSubmitted(controller.text);
          },
        ),
      ],
    );
  }
}
