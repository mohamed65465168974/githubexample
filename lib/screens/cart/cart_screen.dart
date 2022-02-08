import 'package:flutter/material.dart';
import 'package:githubexample/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'cart page'),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
