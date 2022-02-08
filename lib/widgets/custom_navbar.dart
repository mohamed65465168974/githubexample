import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubexample/screens/cart/cart_screen.dart';
import 'package:githubexample/screens/home/home_screen.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      elevation: 8,
      child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Get.offAll(
                    () => HomeScreen(),
                  );
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() => CartScreen());
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Get.to(
                  //   Home(),
                  // );
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ],
          )),
    );
  }
}
