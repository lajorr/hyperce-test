import 'dart:developer';
import 'dart:io';

import 'package:hyperce_test/core/error/exception.dart';
import 'package:hyperce_test/feature/catalog/data/model/shoe_model.dart';
import 'package:injectable/injectable.dart';

abstract interface class CatalogRemoteDatasource {
  Future<List<ShoeModel>> fetchShoesData();
}

const _shoesData = [
  {
    "id": "1",
    "brand": "Nike",
    "name": "Jordan 1 Retro High Tie Dye",
    "rating": 4.5,
    "reviews": 1045,
    "price": 235.00,
    "sizes": [39, 39.5, 40, 40.5, 41],
    "colors": [
      {"hex": "#000000", "name": "Black"},
      {"hex": "#ffffff", "name": "White"},
      {"hex": "#00BCD4", "name": "Cyan"},
      {"hex": "#607D8B", "name": "Blue Grey"},
    ],
    "description":
        "Engineered to crush any movement-based workout, these sneakers enhance the label's original Cloud sneaker with cutting edge technologies.",
  },
  {
    "id": "2",
    "brand": "Jordan",
    "name": "Jordan 1 Retro High OG Bred",
    "rating": 4.6,
    "reviews": 875,
    "price": 235.00,
    "sizes": [39, 40, 41],
    "colors": [
      {"hex": "#000000", "name": "Black"},
      {"hex": "#B71C1C", "name": "Dark Red"},
      {"hex": "#FFFFFF", "name": "White"},
    ],
    "description":
        "A classic Jordan colorway reimagined with premium materials and modern cushioning for comfort and heritage style.",
  },
  {
    "id": "3",
    "brand": "Adidas",
    "name": "Adidas Ultraboost 22",
    "rating": 4.5,
    "reviews": 1045,
    "price": 235.00,
    "sizes": [39, 40, 41, 42],
    "colors": [
      {"hex": "#212121", "name": "Dark Grey"},
      {"hex": "#8BC34A", "name": "Light Green"},
      {"hex": "#E0E0E0", "name": "Grey"},
    ],
    "description":
        "Responsive running shoes with Boost cushioning to deliver energy return with every stride.",
  },
  {
    "id": "4",
    "brand": "Adidas",
    "name": "Adidas ZX 2K Boost",
    "rating": 4.5,
    "reviews": 1045,
    "price": 235.00,
    "sizes": [39, 40, 40.5, 41],
    "colors": [
      {"hex": "#9E9E9E", "name": "Grey"},
      {"hex": "#616161", "name": "Dark Grey"},
      {"hex": "#FFFFFF", "name": "White"},
    ],
    "description":
        "Blending heritage design with modern comfort, these shoes feature a mesh upper and Boost midsole for energy return.",
  },
  {
    "id": "5",
    "brand": "Vans",
    "name": "Vans Sk8-Hi Retro",
    "rating": 4.5,
    "reviews": 1045,
    "price": 235.00,
    "sizes": [39, 40, 41],
    "colors": [
      {"hex": "#1B5E20", "name": "Green"},
      {"hex": "#000000", "name": "Black"},
      {"hex": "#FFFFFF", "name": "White"},
    ],
    "description":
        "Iconic high-top sneakers with sturdy canvas uppers, reinforced toe caps, and signature rubber waffle outsoles.",
  },
  {
    "id": "6",
    "brand": "Reebok",
    "name": "Reebok Zig Kinetica",
    "rating": 4.5,
    "reviews": 1045,
    "price": 235.00,
    "sizes": [39, 39.5, 40, 41],
    "colors": [
      {"hex": "#BDBDBD", "name": "Light Grey"},
      {"hex": "#212121", "name": "Dark Grey"},
      {"hex": "#FFFFFF", "name": "White"},
    ],
    "description":
        "A modern silhouette with Zig Energy Shell cushioning to propel you forward in comfort and style.",
  },
];

@LazySingleton(as: CatalogRemoteDatasource)
final class CatalogRemoteDatasourceImpl implements CatalogRemoteDatasource {
  @override
  Future<List<ShoeModel>> fetchShoesData() async {
    try {
      sleep(const Duration(seconds: 2));
      return _shoesData.map((e) => ShoeModel.fromJson(e)).toList();
    } catch (e) {
      log(e.toString());
      throw ServerException();
    }
  }
}
