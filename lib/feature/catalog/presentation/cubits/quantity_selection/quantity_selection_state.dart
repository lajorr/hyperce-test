part of 'quantity_selection_cubit.dart';

@freezed
abstract class QuantitySelectionState with _$QuantitySelectionState {
  const factory QuantitySelectionState({@Default(1) int quantity}) =
      _QuantitySelectionState;
}
