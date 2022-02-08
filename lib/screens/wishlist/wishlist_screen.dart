import 'package:flutter/material.dart';
import 'package:githubexample/widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'wishlist page'),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
