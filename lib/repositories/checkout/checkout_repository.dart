import 'package:githubexample/models/checkout_model.dart';
import 'package:githubexample/repositories/checkout/base_checkout_repository.dart';

class CheckoutRepository extends BaseCheckoutRepository{
  @override
  Future<void> addCheckout(Checkout checkout) {
    throw UnimplementedError();
  }

}