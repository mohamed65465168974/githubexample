import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubexample/models/models.dart';
import 'package:githubexample/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  final catalog = Get.arguments;
  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == catalog.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: catalog.name),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.85),
          itemCount: categoryProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ProductCard(
                product: categoryProducts[index],
                widthFactor: 2.2,
              ),
            );
          }),
    );
  }
}
