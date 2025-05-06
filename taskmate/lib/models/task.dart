class Task {
  String? id;
  String title;
  bool isCompleted;

  Task({this.id, required this.title, this.isCompleted = false});

  Map<String, dynamic> toJson() => {
        'title': title,
        'isCompleted': isCompleted,
      };

  factory Task.fromFirestore(
    String docId,
    Map<String, dynamic> data,
  ) {
    return Task(
      id: docId,
      title: data['title'] as String,
      isCompleted: data['isCompleted'] as bool,
    );
  }
}
