import 'package:flutter/material.dart';
import 'package:githubexample/widgets/custom_appbar.dart';
import 'package:githubexample/widgets/order_summary.dart';


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();
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
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'ORDER NOW',
                  style: TextStyle(),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Customer information',style: TextStyle(fontSize: 18),),
            _buildTextFromField(emailController, context,'Email'),
            _buildTextFromField(nameController, context,'Full Name'),
            Text('Delivery information',style: TextStyle(fontSize: 18),),
            _buildTextFromField(passwordController, context,'Password'),
            _buildTextFromField(addressController, context,'Address'),
            _buildTextFromField(cityController, context,'City'),
            _buildTextFromField(countryController, context,'Country'),
            _buildTextFromField(zipCodeController, context,'Zip code'),
            Text('Order Summary',style: TextStyle(fontSize: 18),),
            OrderSummary(),
          ],
        ),
      ),
    );
  }

  Padding _buildTextFromField(TextEditingController controller, BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(width: 75,child: Text(
            labelText
          ),),
          Expanded(child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                )
              )
            ),
          ),)
        ],
      ),
    );
  }
}
