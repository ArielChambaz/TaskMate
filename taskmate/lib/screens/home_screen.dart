import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';
import '../services/task_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _service = TaskService();

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
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                _service.addTask(_controller.text);
                Navigator.pop(context);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(Task task) {
    final TextEditingController _controller = TextEditingController(text: task.title);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Task"),
        content: TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: "Enter new title"),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                task.title = _controller.text;
                _service.updateTask(task);
                Navigator.pop(context);
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TaskMate")),
      body: StreamBuilder<List<Task>>(
        stream: _service.tasksStream(),
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final tasks = snap.data ?? [];
          if (tasks.isEmpty) {
            return const Center(child: Text("No tasks added"));
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (_, i) => TaskCard(
              task: tasks[i],
              onDelete: () => _service.deleteTask(tasks[i].id!),
              onToggle: () {
                tasks[i].isCompleted = !tasks[i].isCompleted;
                _service.updateTask(tasks[i]);
              },
              onEdit: () => _showEditDialog(tasks[i]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
