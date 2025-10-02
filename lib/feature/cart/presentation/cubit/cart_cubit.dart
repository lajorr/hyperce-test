import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hyperce_test/feature/cart/domain/entity/cart_item.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  void addItemToCart(CartItem item) {
    final itemExists = state.cartItems.any((cart) => cart.id == item.id);
    if (itemExists) {
      final updated = state.cartItems.map((cart) {
        if (cart == item) {
          return cart.copyWith(quantity: cart.quantity + item.quantity);
        }
        return cart;
      }).toList();
      emit(state.copyWith(cartItems: updated));
    } else {
      emit(state.copyWith(cartItems: [...state.cartItems, item]));
    }
  }

  void removeFromCart(CartItem item) {
    final updated = state.cartItems.where((cart) => cart != item).toList();
    emit(state.copyWith(cartItems: updated));
  }

  void increment(CartItem item) {
    final updated = state.cartItems.map((cart) {
      if (cart == item) {
        return cart.copyWith(quantity: cart.quantity + 1);
      }
      return cart;
    }).toList();

    emit(state.copyWith(cartItems: updated));
  }

  void decrement(CartItem item) {
    if (item.quantity == 1) {
      return;
    }
    final updated = state.cartItems.map((cart) {
      if (cart == item) {
        return cart.copyWith(quantity: cart.quantity - 1);
      }
      return cart;
    }).toList();
    emit(state.copyWith(cartItems: updated));
  }

  void clearCart() => emit(state.copyWith(cartItems: []));

  double get totalAmount => state.cartItems.fold(
    0,
    (previousValue, cart) => previousValue + cart.price * cart.quantity,
  );

  double calculateProductTotal(CartItem item) {
    return item.quantity * item.price;
  }
}
