import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubexample/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  final catalog = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: catalog.name),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
