import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:githubexample/models/models.dart';

import '../../models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(_onCartLoading);
    on<AddProuctToCart>(_onAddProductToCart);
    on<RemoveProuctFromCart>(_onRemoveProductFromCart);
  }

  void _onCartLoading(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded());
    } catch (_) {
      emit(CartError());
    }
  }

  void _onAddProductToCart(AddProuctToCart event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
              cart: Cart(
                  products: List.from(state.cart.products)
                    ..add(event.product))),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }

  void _onRemoveProductFromCart(
      RemoveProuctFromCart event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
              cart: Cart(
                  products: List.from(state.cart.products)
                    ..remove(event.product))),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }
}
