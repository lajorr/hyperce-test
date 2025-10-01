part of 'catalog_bloc.dart';

@freezed
class CatalogState with _$CatalogState {
  const factory CatalogState.loading() = Loading;
  const factory CatalogState.error({String? errorMessage}) = Error;
  const factory CatalogState.success({
    required List<Shoe> data,
    @Default([]) List<String> brandList,
  }) = Success;
}
