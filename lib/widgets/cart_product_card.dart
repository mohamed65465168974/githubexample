import 'package:flutter/material.dart';

import '../models/models.dart';

class CardProductCard extends StatelessWidget {
  final Product product;
  const CardProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                product.imageUrl,
                width: 100,
                height: 80,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      '${product.price} EGP',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.remove_circle),
                  ),
                  Text(
                    '1',
                    style: TextStyle(fontSize: 15),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_circle),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
