import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/todo_model_mutable.dart';

class TodosNotifier extends ChangeNotifier {
  List<Todo> todos = [];

  void addTodo(String description) {
    todos.add(Todo.add(description: description));
    notifyListeners();
  }

  void toggleTodo(String id) {
    final todo = todos.firstWhere((todo) => todo.id == id);
    todo.completed = !todo.completed;
    notifyListeners();
  }

  void removeTodo(String id) {
    todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}

/*
*can be with autoDispose, family and familyAutoDispose mods
 */
final todosProvider = ChangeNotifierProvider<TodosNotifier>((ref) {
  return TodosNotifier();
});
