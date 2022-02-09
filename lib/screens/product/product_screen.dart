import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:githubexample/widgets/widgets.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var product = Get.arguments;
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: CustomNavBar(),
      body: ListView(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 2,
                  viewportFraction: 0.9,
                  enlargeStrategy: CenterPageEnlargeStrategy.height),
              items: [
                HeroCarouselCard(
                  product: product,
                ),
              ]),
        ],
      ),
      // HeroCarouselCard(
      //   product: product,
      // ),
    );
  }
}
