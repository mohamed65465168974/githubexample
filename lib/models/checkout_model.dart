import 'package:equatable/equatable.dart';
import 'package:githubexample/models/models.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final String? subTotal;
  final String? deliveryFree;
  final String? total;
  Checkout({
    required this.fullName,
    required this.email,
    required this.address,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.products,
    required this.subTotal,
    required this.deliveryFree,
    required this.total,
});
  @override
  List<Object?> get props => [fullName,email,address,city,country,zipCode,products,subTotal,deliveryFree,total];

  // take checkout model and transform it to a map to upload it to firestore
  Map<String,Object> toDocument(){
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;
    return{
      'customerAddress' : customerAddress,
      'customerName' : fullName!,
      'customerEmail' : email!,
        'products' : products!.map((product) => product.name).toList(),
      'subtotal' : subTotal!,
      'deliveryFee' : deliveryFree!,
      'total' : total!,
    };
  }
}