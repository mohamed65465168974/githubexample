part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();
  @override
  List<Object?> get props => [];
}

/// udpate checkout state every time there is a change in the text form field
class UpdateCheckout extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final Cart? cart;

  UpdateCheckout(
      {this.fullName,
      this.email,
      this.address,
      this.city,
      this.country,
      this.zipCode,
      this.cart});

  @override
  List<Object?> get props => [fullName, email, city, address, zipCode, cart];
}

/// event used to submit data to fire store
class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;
  const ConfirmCheckout({required this.checkout});
  @override
  List<Object?> get props => [checkout];
}
