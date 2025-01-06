import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/text_widget.dart';

import '../../../../../widgets/mini_widgets.dart';
import 'product_providers.dart';

class ProductPage extends ConsumerWidget {
  final int id;
  const ProductPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singleProduct = ref.watch(getProductProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Product Detail', TextType.titleMedium),
      ),
      body: singleProduct.when(
          data: (product) {
            return ListView(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: TextWidget(id.toString(), TextType.titleMedium),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextWidget(product.title, TextType.headline),
                    )
                  ],
                ),
                const Divider(),
                BulletedList(
                  bullet: const Icon(Icons.check, color: Colors.green),
                  listItems: [
                    'brand: ${product.brand}',
                    'price: \$${product.price}',
                    'discount(%): ${product.discountPercentage}',
                    'stock: ${product.stock}',
                    'category: ${product.category}',
                    'description: ${product.description}',
                  ],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Divider(),
                SizedBox(
                  width: double.infinity,
                  child: Image.network(product.thumbnail, fit: BoxFit.cover),
                ),
              ],
            );
          },
          error: (e, st) => AppMiniWidgets(MWType.error, error: e),
          loading: () => const AppMiniWidgets(MWType.loading)),
    );
  }
}
