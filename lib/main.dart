import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/product_repository_impl.dart';
import 'data/sources/product_remote_data_source.dart';
import 'domain/usecases/get_products.dart';
import 'presentation/bloc/products/product_bloc.dart';
import 'presentation/bloc/cart/cart_bloc.dart';
import 'presentation/screens/product_list_screen.dart';
import 'core/utils/api_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient();
    final productRemoteDataSource =
        ProductRemoteDataSourceImpl(apiClient: apiClient);
    final productRepository =
        ProductRepositoryImpl(remoteDataSource: productRemoteDataSource);
    final getProducts = GetProducts(productRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductBloc(getProducts: getProducts)..add(FetchProducts()),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product Cart App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductListScreen(),
      ),
    );
  }
}
