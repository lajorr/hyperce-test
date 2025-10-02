import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'quantity_selection_cubit.freezed.dart';
part 'quantity_selection_state.dart';

@injectable
class QuantitySelectionCubit extends Cubit<QuantitySelectionState> {
  QuantitySelectionCubit() : super(QuantitySelectionState());

  void increment() {
    final newQuantity = state.quantity + 1;
    emit(state.copyWith(quantity: newQuantity));
  }

  void decrement() {
    if (state.quantity == 1) {
      return;
    }
    final newQuantity = state.quantity - 1;
    emit(state.copyWith(quantity: newQuantity));
  }
}
