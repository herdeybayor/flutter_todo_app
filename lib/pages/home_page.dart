import 'package:flutter/material.dart';
import 'package:todo_app/components/create_task_dialog.dart';
import 'package:todo_app/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<List<dynamic>> tasks = [
    ["Make Tutorial", false],
    ["Buy Groceries", true],
    //   ["Walk the Dog", false],
    //   ["Read a Book", true],
    //   ["Write Code", false],
    //   ["Exercise", true],
    //   ["Cook Dinner", false],
    //   ["Clean the House", true],
    //   ["Call a Friend", false],
    //   ["Plan the Week", true]
  ];

  Function(bool?) onChanged(int index) {
    return (value) {
      setState(() {
        tasks[index][1] = value;
      });
    };
  }

  void createTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CreateTaskDialog(
            onSubmitted: (value) {
              print(value);
              setState(() {
                tasks.add([value, false]);
              });
              Navigator.of(context).pop();
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Text("TO DO"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            itemBuilder: (BuildContext context, int index) => TodoTile(
                  taskName: tasks[index][0],
                  taskCompleted: tasks[index][1],
                  onChanged: onChanged(index),
                  deleteTask: () {
                    setState(() {
                      tasks.removeAt(index);
                    });
                  },
                ),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemCount: tasks.length));
  }
}
