import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:githubexample/blocs/category/category_bloc.dart';
import 'package:githubexample/blocs/product/product_bloc.dart';
import 'package:githubexample/blocs/wishlist/wishlist_bloc.dart';
import 'package:githubexample/repositories/category/category_repository.dart';
import 'package:githubexample/repositories/product/product_repository.dart';
import 'blocs/cart/cart_bloc.dart';
import 'screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(LoadWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
        BlocProvider(
            create: (_) =>
                CategoryBloc(CategoryRepository())..add(LoadCategories())),
        BlocProvider(
            create: (_) =>
            ProductBloc(productRepository: ProductRepository())..add(LoadProducts())),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter second commit',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
