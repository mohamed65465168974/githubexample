part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();
}

class WishlistInitial extends WishlistState {
  @override
  List<Object> get props => [];
}
