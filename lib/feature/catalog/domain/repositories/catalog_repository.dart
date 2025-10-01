import 'package:dartz/dartz.dart';
import 'package:hyperce_test/core/error/failure.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';

abstract interface class CatalogRepository {
  Future<Either<Failure, List<Shoe>>> getAllShoes();
}
