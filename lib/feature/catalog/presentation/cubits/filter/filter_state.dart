part of 'filter_cubit.dart';

@freezed
abstract class FilterState with _$FilterState {
  const factory FilterState({
    @Default([]) List<Shoe> filteredShoes,
    @Default("All") String selectedBrand,
  }) = _FilterState;
}
