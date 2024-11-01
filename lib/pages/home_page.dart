import 'package:flutter/material.dart';
import 'package:todo_app/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> tasks = [
    {"taskName": "Make Tutorial", "taskCompleted": false},
    {"taskName": "Buy Groceries", "taskCompleted": true},
    {"taskName": "Walk the Dog", "taskCompleted": false},
    {"taskName": "Read a Book", "taskCompleted": true},
    {"taskName": "Write Code", "taskCompleted": false},
    {"taskName": "Exercise", "taskCompleted": true},
    {"taskName": "Cook Dinner", "taskCompleted": false},
    {"taskName": "Clean the House", "taskCompleted": true},
    {"taskName": "Call a Friend", "taskCompleted": false},
    {"taskName": "Plan the Week", "taskCompleted": true}
  ];

  Function(bool?) onChanged(int index) {
    return (value) {
      setState(() {
        tasks[index]["taskCompleted"] = value;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Text("TO DO"),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            itemBuilder: (BuildContext context, int index) => TodoTile(
                  taskName: tasks[index]["taskName"],
                  taskCompleted: tasks[index]["taskCompleted"],
                  onChanged: onChanged(index),
                ),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemCount: tasks.length));
  }
}
