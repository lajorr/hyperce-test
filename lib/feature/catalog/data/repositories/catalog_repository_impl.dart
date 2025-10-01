import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hyperce_test/core/error/exception.dart';
import 'package:hyperce_test/core/error/failure.dart';
import 'package:hyperce_test/feature/catalog/data/datasources/catalog_remote_datasource.dart';
import 'package:hyperce_test/feature/catalog/data/model/shoe_model.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';
import 'package:hyperce_test/feature/catalog/domain/repositories/catalog_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CatalogRepository)
final class CatalogRepositoryImpl implements CatalogRepository {
  CatalogRepositoryImpl({required this.remoteDatasource});

  final CatalogRemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, List<Shoe>>> getAllShoes() async {
    try {
      final result = await remoteDatasource.fetchShoesData();
      final shoes = result.map((shoe) => shoe.toEntity()).toList();
      return Right(shoes);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure("Unknown error"));
    }
  }
}
