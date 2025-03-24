import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [];

  void _addTask(String title) {
    setState(() {
      _tasks.add(Task(title: title));
    });
  }

  void _editTask(int index) {
    final TextEditingController _controller =
        TextEditingController(text: _tasks[index].title);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Task"),
        content: TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: "Enter title"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                setState(() {
                  _tasks[index].title = _controller.text;
                });
                Navigator.pop(context);
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _showAddTaskDialog() {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add Task"),
        content: TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: "Enter title"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                _addTask(_controller.text);
                Navigator.pop(context);
              }
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
      appBar: AppBar(title: const Text("TaskMate")),
      body: _tasks.isEmpty
          ? const Center(child: Text("No tasks added"))
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) => TaskCard(
                task: _tasks[index],
                onDelete: () => _deleteTask(index),
                onToggle: () => _toggleTask(index),
                onEdit: () => _editTask(index),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}