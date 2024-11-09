import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'item_model.dart';

part 'item_list_provider.g.dart';

@riverpod
class ItemList extends _$ItemList {
  @override
  List<Item> build() {
    return [];
  }

  void addItem(String text) {
    final newItem = Item(
      text: text,
      createdAt: DateTime.now(),
    );
    state = [...state, newItem];
  }

  void deleteItem(String text) {
    state = state.where((item) => item.text != text).toList();
  }
}

@Riverpod(dependencies: [])
Item currentItem(Ref ref) {
  throw UnimplementedError();
}
