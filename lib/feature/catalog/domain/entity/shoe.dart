import 'package:freezed_annotation/freezed_annotation.dart';

part 'shoe.freezed.dart';
part 'shoe.g.dart';

@freezed
abstract class Shoe with _$Shoe {
  const factory Shoe({
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
  }) = _Shoe;

  factory Shoe.fromJson(Map<String, dynamic> json) => _$ShoeFromJson(json);
}
