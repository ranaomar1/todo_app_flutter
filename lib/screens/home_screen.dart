import 'package:flutter/material.dart';
import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  void addTask(String title) {
    setState(() {
      tasks.add(Task(title: title));
    });
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index].isDone = !tasks[index].isDone;
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void showAddDialog() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Task"),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () {
              addTask(controller.text);
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task Manager")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(
              tasks[index].title,
              style: TextStyle(
                decoration: tasks[index].isDone
                    ? TextDecoration.lineThrough
                    : null,
              ), //textstyle
            ),
            leading: Checkbox(
              value: tasks[index].isDone,
              onChanged: (_) => toggleTask(index),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => deleteTask(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
