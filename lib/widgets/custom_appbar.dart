import 'package:flutter/material.dart';

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
            onPressed: () {},
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
