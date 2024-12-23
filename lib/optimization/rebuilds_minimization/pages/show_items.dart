import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../items/item_list_provider.dart';

class ShowItems extends ConsumerWidget {
  const ShowItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemListProvider);

    return ListView(
      children: [
        for (final item in items)
          ProviderScope(
            overrides: [currentItemProvider.overrideWithValue(item)],
            child: const EachItem(),
          )
      ],
    );
  }
}

class EachItem extends ConsumerWidget {
  const EachItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentItemProvider);
    print('building ${item.text}');

    return ListTile(  
      title: Text(
        item.text,
        style: const TextStyle(fontSize: 18.0),
      ),
      subtitle: Text(
        'Дата створення: ${item.createdAt}',
        style: const TextStyle(fontSize: 14.0, color: Colors.grey),
      ),
      trailing: IconButton(
        onPressed: () {
          ref.read(itemListProvider.notifier).deleteItem(item.text);
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
