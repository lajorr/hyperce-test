part of 'cart_cubit.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({@Default([]) List<CartItem> cartItems}) = _CartState;
}
