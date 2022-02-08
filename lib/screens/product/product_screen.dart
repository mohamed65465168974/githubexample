import 'package:flutter/material.dart';
import 'package:githubexample/widgets/widgets.dart';

class ProuctScreen extends StatelessWidget {
  const ProuctScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'product page'),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
