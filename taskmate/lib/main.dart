import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TaskMate());
}

class TaskMate extends StatelessWidget {
  const TaskMate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskMate',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
