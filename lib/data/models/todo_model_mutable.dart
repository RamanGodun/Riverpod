import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Todo {
  String id;
  String description;
  bool completed;
  Todo({
    required this.id,
    required this.description,
    this.completed = false,
  });

  factory Todo.add({required String description}) {
    return Todo(id: uuid.v4(), description: description);
  }

  @override
  String toString() => 'Todo(id: $id, description: $description, completed: $completed)';
}
