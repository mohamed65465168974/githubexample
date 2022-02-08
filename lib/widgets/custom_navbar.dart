import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.lightGreen,
      elevation: 8,
      child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  // Get.to(
                  //   Home(),
                  // );
                },
                icon: Icon(
                  Icons.home,
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
