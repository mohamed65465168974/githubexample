import 'package:flutter/material.dart';
import 'package:githubexample/models/models.dart';
import 'package:get/get.dart';
import 'package:githubexample/screens/product/product_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final widthFactor;
  const ProductCard({
    required this.product,
    this.widthFactor = 2.5,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          Get.to(() => ProductScreen(), arguments: product);
        },
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / widthFactor,
              height: 150,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${product.price} EGP',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  IconButton(
                    alignment: Alignment.topRight,
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}