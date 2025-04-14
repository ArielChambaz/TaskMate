class Task {
  int? id; // Ajout de l'ID
  String title;
  bool isCompleted;

  Task({this.id, required this.title, this.isCompleted = false});

  // Convertir un objet Task en Map pour SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  // Convertir une Map SQLite en objet Task
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      isCompleted: map['isCompleted'] == 1,
    );
  }
}