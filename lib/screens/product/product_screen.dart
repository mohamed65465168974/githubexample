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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          '${product.price} EGP',
                          style: TextStyle(color: Colors.green, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Product Information',
              ),
              textColor: Colors.black,
              children: [
                ListTile(
                  title: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mollis tincidunt ullamcorper. In hac habitasse platea dictumst. Ut tincidunt pulvinar odio, eget dignissim mi fermentum id. Nam ac sapien in mi imperdiet blandit. Etiam tincidunt bibendum neque eu posuere. Nunc posuere scelerisque mattis. Maecenas fermentum sem non condimentum molestie. Quisque turpis libero, accumsan vitae fringilla a, venenatis sollicitudin magna. Maecenas magna dui, pharetra nec lobortis nec, lobortis sit amet libero.'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Delivery Information',
              ),
              textColor: Colors.black,
              children: [
                ListTile(
                  title: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mollis tincidunt ullamcorper. In hac habitasse platea dictumst. Ut tincidunt pulvinar odio, eget dignissim mi fermentum id. Nam ac sapien in mi imperdiet blandit. Etiam tincidunt bibendum neque eu posuere. Nunc posuere scelerisque mattis. Maecenas fermentum sem non condimentum molestie. Quisque turpis libero, accumsan vitae fringilla a, venenatis sollicitudin magna. Maecenas magna dui, pharetra nec lobortis nec, lobortis sit amet libero.'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
