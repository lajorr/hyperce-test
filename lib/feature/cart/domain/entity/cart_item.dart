import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hyperce_test/feature/catalog/domain/entity/shoe.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
abstract class CartItem with _$CartItem {
  factory CartItem({
    required String id,
    required String itemName,
    required String image,
    required String brand,
    required double price,
    required int quantity,
    required ItemColor color,
    required double size,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
