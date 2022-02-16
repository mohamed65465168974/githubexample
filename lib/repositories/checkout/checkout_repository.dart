import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:githubexample/models/checkout_model.dart';
import 'package:githubexample/repositories/checkout/base_checkout_repository.dart';

class CheckoutRepository extends BaseCheckoutRepository{
  final FirebaseFirestore _firebaseFirestore;
  // if it is null create a new instance
  CheckoutRepository({FirebaseFirestore? firebaseFirestore}) : _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<void> addCheckout(Checkout checkout) {
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }

}