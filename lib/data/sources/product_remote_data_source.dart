import 'package:product_cart_app/core/utils/api_client.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiClient apiClient;

  ProductRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<ProductModel>> getProducts() async {
    final products = await apiClient.fetchProducts();
    return products.map((product) => ProductModel.fromJson(product)).toList();
  }
}
