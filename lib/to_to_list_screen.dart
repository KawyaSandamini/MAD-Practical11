// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();

  void _addTask(String task) {
    setState(() {
      tasks.add(task);
    });
    taskController.clear();
  }

  void _toggleTask(int index) {
    setState(() {
      tasks[index] = tasks[index].startsWith('✅ ') ? tasks[index].substring(2) : '✅ ${tasks[index]}';
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _clearAllTasks() {
    setState(() {
      tasks.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: 'Enter a task',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (taskController.text.isNotEmpty) {
                      _addTask(taskController.text);
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      tasks[index],
                      style: TextStyle(
                        decoration: tasks[index].startsWith('✅ ') ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.check),
                          onPressed: () => _toggleTask(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteTask(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _clearAllTasks,
              child: Text('Clear All'),
            ),
          ],
        ),
      ),
    );
  }
}
