import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
    builder: (context, state) {
    if (state is CartLoaded){
      return Column(
        children: [
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 40.0, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sub Total',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      '${state.cart.subtotalString}',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Fee',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      '${state.cart.deliveryFeeString} EGP',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Colors.grey[200],
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style:
                        Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '${state.cart.totalString} EGP',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }else {
      return Text('something went wrong');
    }

  },
); 
  }
}
