import 'package:dartz/dartz.dart';
import 'package:hyperce_test/core/error/failure.dart';
import 'package:hyperce_test/core/usecases/usecase.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';
import 'package:hyperce_test/feature/catalog/domain/repositories/catalog_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllShoesUsecase implements UseCase<List<Shoe>, NoParams> {
  GetAllShoesUsecase({required this.catalogRepository});

  final CatalogRepository catalogRepository;
  @override
  Future<Either<Failure, List<Shoe>>> call(NoParams params) async {
    return await catalogRepository.getAllShoes();
  }
}
