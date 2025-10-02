import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hyperce_test/core/utils/image_util.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';

part 'shoe_model.freezed.dart';
part 'shoe_model.g.dart';

@freezed
abstract class ShoeModel with _$ShoeModel {
  const factory ShoeModel({
    required String id,
    required String brand,
    required String name,
    required double rating,
    required int reviews,
    required double price,
    required List<double> sizes,
    required List<ItemColorModel> colors,
    required String description,
  }) = _ShoeModel;

  factory ShoeModel.fromJson(Map<String, dynamic> json) =>
      _$ShoeModelFromJson(json);
}

@freezed
abstract class ItemColorModel with _$ItemColorModel {
  factory ItemColorModel({required String hex, required String name}) =
      _ItemColorModel;

  factory ItemColorModel.fromJson(Map<String, dynamic> json) =>
      _$ItemColorModelFromJson(json);
}

extension ShoeModelX on ShoeModel {
  Shoe toEntity() => Shoe(
    id: id,
    brand: brand,
    name: name,
    images: ImageUtil.getImagesFromAsset(),
    rating: rating,
    reviews: reviews,
    price: price,
    sizes: sizes,
    colors: colors.map((c) => c.toEntity()).toList(),
    description: description,
    brandLogo: ImageUtil.getBrandLogo(brand),
  );
}

extension ItemColorModelX on ItemColorModel {
  ItemColor toEntity() => ItemColor(hex: hex, name: name);
}
