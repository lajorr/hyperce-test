import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'shoe_variant_cubit.freezed.dart';
part 'shoe_variant_state.dart';

@injectable
class ShoeVariantCubit extends Cubit<ShoeVariantState> {
  ShoeVariantCubit() : super(ShoeVariantState());

  void changeColor(String color) => emit(state.copyWith(selectedColor: color));
  void changeSize(double size) => emit(state.copyWith(selectedSize: size));
}
