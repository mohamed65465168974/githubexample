import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:githubexample/screens/home/home_screen.dart';
import 'package:githubexample/widgets/custom_appbar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => Get.offAll(HomeScreen()));
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            'Welecome',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ]),
    );
  }
}
