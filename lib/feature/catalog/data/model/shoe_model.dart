import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';

part 'shoe_model.freezed.dart';
part 'shoe_model.g.dart';

@freezed
abstract class ShoeModel with _$ShoeModel {
  const factory ShoeModel({
    required String id,
    required String brand,
    required String name,
    required List<String> images,
    required double rating,
    required int reviews,
    required int price,
    required List<double> sizes,
    required List<String> colors,
    required String description,
  }) = _ShoeModel;

  factory ShoeModel.fromJson(Map<String, dynamic> json) =>
      _$ShoeModelFromJson(json);
  factory ShoeModel.fromEntity(Shoe entity) => ShoeModel(
    id: entity.id,
    brand: entity.brand,
    name: entity.name,
    images: entity.images,
    rating: entity.rating,
    reviews: entity.reviews,
    price: entity.price,
    sizes: entity.sizes,
    colors: entity.colors,
    description: entity.description,
  );
}

extension ShoeModelX on ShoeModel {
  Shoe toEntity() => Shoe(
    id: id,
    brand: brand,
    name: name,
    images: images,
    rating: rating,
    reviews: reviews,
    price: price,
    sizes: sizes,
    colors: colors,
    description: description,
  );
}
