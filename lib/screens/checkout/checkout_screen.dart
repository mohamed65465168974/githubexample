import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubexample/widgets/custom_appbar.dart';
import 'package:githubexample/widgets/order_summary.dart';

import '../../blocs/checkout/checkout_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'checkout'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 40,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                    if (state is CheckoutLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    if (state is CheckoutLoaded){
                      return ElevatedButton(
                        onPressed: () {
                          context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout));
                        },
                        child: Text(
                          'ORDER NOW',
                          style: TextStyle(),
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                      );
                    }
                    else {
                      return Text('something went wrong');
                    }
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customer information',
                    style: TextStyle(fontSize: 18),
                  ),
                  _buildTextFromField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(email: value));
                  }, context, 'Email'),
                  _buildTextFromField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(fullName: value));
                  }, context, 'Full Name'),
                  Text(
                    'Delivery information',
                    style: TextStyle(fontSize: 18),
                  ),
                  _buildTextFromField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(address: value));
                  }, context, 'Address'),
                  _buildTextFromField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(city: value));
                  }, context, 'City'),
                  _buildTextFromField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(country: value));
                  }, context, 'Country'),
                  _buildTextFromField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(zipCode: value));
                  }, context, 'Zip code'),
                  Text(
                    'Order Summary',
                    style: TextStyle(fontSize: 18),
                  ),
                  OrderSummary(),
                ],
              );
            } else {
              return Text('something went wrong');
            }
          },
        ),
      ),
    );
  }

  Padding _buildTextFromField(Function(String)? onChanged, BuildContext context,
      String labelText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(labelText),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.only(left: 10),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
