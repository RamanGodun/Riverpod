// ignore_for_file: functional_ref
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/models/product.dart';
import 'dio_provider.dart';

part 'providers.g.dart';

@riverpod
FutureOr<List<Product>> getProducts(GetProductsRef ref) async {
  final cancelToken = CancelToken();
  Timer? timer;

  print('[getProductsProvider] initialized');
  ref.onAddListener(() {
    print('[getProductsProvider] listener added');
  });
  ref.onRemoveListener(() {
    print('[getProductsProvider] listener removed');
  });
  ref.onCancel(() {
    print('[getProductsProvider] cancelled');
  });
  ref.onResume(() {
    print('[getProductsProvider] resumed, timer cancelled');
    timer?.cancel();
  });
  ref.onDispose(() {
    print('[getProductsProvider] disposed, token cancelled, timer cancelled');
    timer?.cancel();
    cancelToken.cancel();
  });

/* when user cancel entering the page BEFORE getting the response,
  app backs but requested data are obtained "behind the scenes"
  DISPOSE method are NOT called (!)
 */
  final keepAliveLink = ref.keepAlive();

  final response = await ref.watch(dioProvider).get(
        '/products',
        cancelToken: cancelToken,
      );

  ref.onCancel(() {
    print('[getProductsProvider] cancelled, timer started');
    timer = Timer(const Duration(seconds: 10), () {
      keepAliveLink.close();
    });
  });

/* Getting products data
 */
  final List productList = response.data['products'];
  print(productList[0]);
  final products = [
    for (final product in productList) Product.fromJson(product)
  ];
  return products;
}

@riverpod
FutureOr<Product> getProduct(
  GetProductRef ref, {
  required int productId,
}) async {
  final cancelToken = CancelToken();
  Timer? timer;

  print('[getProductProvider($productId)] initialized');
  ref.onAddListener(() {
    print('[getProductProvider($productId)] listener added');
  });
  ref.onRemoveListener(() {
    print('[getProductProvider($productId)] listener removed');
  });
  ref.onCancel(() {
    print('[getProductWith25SecCache($productId)] cancelled, timer started');
  });
  ref.onResume(() {
    print('[getProductProvider($productId)] resumed');
    timer?.cancel();
  });
  ref.onDispose(() {
    print('[getProductProvider($productId)] disposed');
    timer?.cancel();
    cancelToken.cancel();
  });

  /*
     when keepAliveLink is after response and user cancel entering the page BEFORE getting the response,
app backs but requested data are NOT obtained "behind the scenes" and DISPOSE method are called (!)
   */
  final response = await ref.watch(dioProvider).get(
        '/products/$productId',
        cancelToken: cancelToken,
      );
  final keepAliveLink = ref.keepAlive();

  ref.onCancel(() {
    print('[getProductWith25SecCache($productId)] cancelled, timer started');
    timer = Timer(const Duration(seconds: 25), () {
      keepAliveLink.close();
    });
  });

/* Getting product data
 */
  final product = Product.fromJson(response.data);
  return product;
//
}
