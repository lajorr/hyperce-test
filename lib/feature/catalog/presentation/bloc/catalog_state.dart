part of 'catalog_bloc.dart';

@freezed
class CatalogState with _$CatalogState {
  const factory CatalogState.loading() = _Loading;
  const factory CatalogState.error({String? errorMessage}) = _Error;
  const factory CatalogState.success({required List<Shoe> data}) = _Success;
}
