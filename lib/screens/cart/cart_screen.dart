import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:githubexample/blocs/cart/cart_bloc.dart';
import 'package:githubexample/screens/screens.dart';
import 'package:githubexample/widgets/widgets.dart';

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
                  onPressed: () {
                    Get.to(()=> CheckoutScreen());
                  },
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
        body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.cart.freeDeliveryString,
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
                            return CardProductCard(
                                product: state.cart
                                    .productQuantity(state.cart.products)
                                    .keys
                                    .elementAt(index),
                                quantity: state.cart
                                    .productQuantity(state.cart.products)
                                    .values
                                    .elementAt(index));
                          }),
                          itemCount: state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .length,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                     OrderSummary(),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Text('something went wrong');
          }
        }));
  }
}
