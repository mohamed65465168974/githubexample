import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:githubexample/models/checkout_model.dart';
import 'package:githubexample/repositories/checkout/checkout_repository.dart';

import '../../models/cart_model.dart';
import '../../models/product_model.dart';
import '../cart/cart_bloc.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;
  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  })  : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
                subTotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                deliveryFree:
                    (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                total: (cartBloc.state as CartLoaded).cart.totalString,
              )
            : CheckoutLoading()) {
    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);
    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
    });
  }

  void _onUpdateCheckout(UpdateCheckout event, Emitter<CheckoutState> emit) {
    final state = this.state;
    if(state is CheckoutLoaded){
      emit(
        CheckoutLoaded(
          email: event.email ?? state.email,
          fullName: event.fullName ?? state.fullName,
          products: event.cart?.products ?? state.products,
          deliveryFree: event.cart?.deliveryFeeString ?? state.deliveryFree,
          subTotal: event.cart?.subtotalString ?? state.subTotal,
          total: event.cart?.totalString ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          zipCode: event.zipCode ?? state.zipCode,
        )
      );
    }
  }

  void _onConfirmCheckout(ConfirmCheckout event, Emitter<CheckoutState> emit)async {
    _checkoutSubscription?.cancel();
    if(state is CheckoutLoaded){
      try{
        await _checkoutRepository.addCheckout(event.checkout);
        print('Done');
        emit(CheckoutLoading());
      }catch(_){

      }
    }
  }
}
