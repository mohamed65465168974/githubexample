import 'package:flutter/material.dart';
import 'package:githubexample/models/models.dart';
import 'package:githubexample/widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'wishlist page'),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 1.7),
          itemCount: Product.products.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ProductCard(
                product: Product.products[index],
                widthFactor: 1.1,
              ),
            );
          }),
    );
  }
}
