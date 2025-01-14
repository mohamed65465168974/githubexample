part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddProuctToCart extends CartEvent {
  final Product product;
  const AddProuctToCart(this.product);
  @override
  List<Object> get props => [product];
}

class RemoveProuctFromCart extends CartEvent {
  final Product product;
  const RemoveProuctFromCart(this.product);
  @override
  List<Object> get props => [product];
}
