import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hyperce_test/core/usecases/usecase.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';
import 'package:hyperce_test/feature/catalog/domain/usecases/get_all_shoes_usecase.dart';

part 'catalog_bloc.freezed.dart';
part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc({required this.getAllShoesUsecase}) : super(_Loading()) {
    on<_LoadShoes>(_onLoadShoes);
  }

  final GetAllShoesUsecase getAllShoesUsecase;

  FutureOr<void> _onLoadShoes(
    _LoadShoes event,
    Emitter<CatalogState> emit,
  ) async {
    emit(const CatalogState.loading());
    final result = await getAllShoesUsecase.call(NoParams());
    result.fold(
      (failure) => emit(CatalogState.error(errorMessage: failure.message)),
      (shoeList) => emit(CatalogState.success(data: shoeList)),
    );
  }
}
