part of 'shoe_variant_cubit.dart';

@freezed
abstract class ShoeVariantState with _$ShoeVariantState {
  const factory ShoeVariantState({
    @Default(null) ItemColor? selectedColor,
    @Default(null) double? selectedSize,
  }) = _ShoeVariantState;
}
