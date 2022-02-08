import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubexample/screens/screens.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 0.0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            onPressed: () {
              Get.to(() => WishlistScreen());
            },
            icon: Icon(Icons.favorite),
          ),
        )
      ],
      title: Container(
        child: Text(title),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
