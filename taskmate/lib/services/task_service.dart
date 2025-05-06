import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class TaskService {
  final _col = FirebaseFirestore.instance.collection('tasks');

  Stream<List<Task>> tasksStream() {
    return _col.orderBy('title').snapshots().map((snap) {
      return snap.docs
          .map((doc) => Task.fromFirestore(doc.id, doc.data()))
          .toList();
    });
  }

  Future<void> addTask(String title) {
    return _col.add(Task(title: title).toJson());
  }

  Future<void> updateTask(Task t) {
    return _col.doc(t.id).update(t.toJson());
  }

  Future<void> deleteTask(String id) {
    return _col.doc(id).delete();
  }
}