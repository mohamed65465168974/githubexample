import 'package:flutter/material.dart';
import 'package:githubexample/models/models.dart';
import 'package:get/get.dart';
import 'package:githubexample/screens/product/product_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final widthFactor;
  final bool isWishlist;
  const ProductCard({
    required this.product,
    this.widthFactor = 2.5,
    this.isWishlist = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return SingleChildScrollView(
      child: InkWell(
        onTap: () {
          Get.to(() => ProductScreen(), arguments: product);
        },
        child: Column(
          children: [
            Container(
              width: widthValue,
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
              width: widthValue,
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
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.green,
                        ),
                      ),
                      isWishlist
                          ? IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.green,
                              ),
                            )
                          : SizedBox(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
