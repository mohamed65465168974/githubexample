import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubexample/models/cart_model.dart';
import 'package:githubexample/screens/screens.dart';
import 'package:githubexample/widgets/widgets.dart';
import '../../models/models.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'cart page'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 40,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'GO TO CHECKOUT',
                  style: TextStyle(),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'add \$20.0 for FREE Delivery',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 320,
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      return CardProductCard(product: Cart().products[index]);
                    }),
                    itemCount: Cart().products.length,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub Total',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '${Cart().subtotalString}',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '${Cart().deliveryFeeString} EGP',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              '250.0 EGP',
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
