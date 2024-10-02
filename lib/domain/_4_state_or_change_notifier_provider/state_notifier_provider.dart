import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/todo_model_immutable.dart';

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

  void addTodo(String description) {
    state = [...state, Todo.add(description: description)];
    // print('in addTodo: $state');
  }

  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo
    ];
  }

  void removeTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id != id) todo
    ];
  }
}

/*
*can be with autoDispose, family and familyAutoDispose mods
 */
final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});
