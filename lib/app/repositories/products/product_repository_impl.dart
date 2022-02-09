import 'dart:developer';

import 'package:rango_mobile/app/core/rest_client/rest_client.dart';
import 'package:rango_mobile/app/models/product_model.dart';
import 'package:rango_mobile/app/repositories/products/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RestClient _restClient;

  ProductRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<ProductModel>> findAll() async {
    final result = await _restClient.get('/products/');

    if (result.hasError) {
      log(
        'Erro ao buscar produto ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar produtos');
    }

    return result.body
        .map<ProductModel>((p) => ProductModel.fromMap(p))
        .toList();
  }
}
