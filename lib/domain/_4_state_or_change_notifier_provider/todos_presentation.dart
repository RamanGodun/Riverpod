import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/text_field.dart';
import '../../widgets/text_widgets.dart';
import 'change_notifier_provider.dart';

class TodosPage extends ConsumerWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final todos = ref.watch(todosProvider); // when with state notifier provider
    final todos =
        ref.watch(todosProvider).todos; // when with change notifier provider
    print(todos);

    return Scaffold(
      appBar: AppBar(
        title: TextWidgets.titleMediumText(context, 'Todos'),
      ),
      body: Column(
        children: [
          const AppTextField(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                for (final todo in todos)
                  CheckboxListTile(
                    visualDensity: VisualDensity.compact,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: todo.completed,
                    onChanged: (value) =>
                        ref.read(todosProvider.notifier).toggleTodo(todo.id),
                    title: TextWidgets.titleMediumText(context,
                        todo.description), // перевірка на назву властивості
                    secondary: IconButton(
                      onPressed: () =>
                          ref.read(todosProvider.notifier).removeTodo(todo.id),
                      icon: const Icon(Icons.delete),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
