import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';

part 'filter_cubit.freezed.dart';
part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState());

  void applyBrandFilter({required List<Shoe> shoes, required String brand}) {
    if (brand.toLowerCase() == "all") {
      emit(state.copyWith(filteredShoes: shoes, selectedBrand: brand));
      return;
    }
    final filteredShoes = shoes
        .where((shoe) => shoe.brand.toLowerCase() == brand.toLowerCase())
        .toList();
    emit(state.copyWith(filteredShoes: filteredShoes, selectedBrand: brand));
  }
}
