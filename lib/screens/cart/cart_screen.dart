import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubexample/screens/screens.dart';
import 'package:githubexample/widgets/widgets.dart';
import '../../models/models.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'cart page'),
      bottomNavigationBar: CustomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'add \$20.0 for FREE Delivery',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    elevation: 0.0,
                  ),
                  onPressed: () {
                    Get.offAll(HomeScreen());
                  },
                  child: Text(
                    'Add more items',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            CardProductCard(product: Product.products[0]),
          ],
        ),
      ),
    );
  }
}
