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
    "images": [
      "https://example.com/shoes/jordan-tie-dye-1.png",
      "https://example.com/shoes/jordan-tie-dye-2.png",
      "https://example.com/shoes/jordan-tie-dye-3.png",
    ],
    "rating": 4.5,
    "reviews": 1045,
    "price": 235.00,
    "sizes": [39, 39.5, 40, 40.5, 41],
    "colors": ["#000000", "#ffffff", "#00BCD4", "#607D8B"],
    "description":
        "Engineered to crush any movement-based workout, these sneakers enhance the label's original Cloud sneaker with cutting edge technologies.",
  },
  {
    "id": "2",
    "brand": "Jordan",
    "name": "Jordan 1 Retro High OG Bred",
    "images": [
      "https://example.com/shoes/jordan-bred-1.png",
      "https://example.com/shoes/jordan-bred-2.png",
      "https://example.com/shoes/jordan-bred-3.png",
    ],
    "rating": 4.6,
    "reviews": 875,
    "price": 235.00,
    "sizes": [39, 40, 41],
    "colors": ["#000000", "#B71C1C", "#FFFFFF"],
    "description":
        "A classic Jordan colorway reimagined with premium materials and modern cushioning for comfort and heritage style.",
  },
  {
    "id": "3",
    "brand": "Adidas",
    "name": "Adidas Ultraboost 22",
    "images": [
      "https://example.com/shoes/adidas-ultraboost-1.png",
      "https://example.com/shoes/adidas-ultraboost-2.png",
      "https://example.com/shoes/adidas-ultraboost-3.png",
    ],
    "rating": 4.5,
    "reviews": 1045,
    "price": 235.00,
    "sizes": [39, 40, 41, 42],
    "colors": ["#212121", "#8BC34A", "#E0E0E0"],
    "description":
        "Responsive running shoes with Boost cushioning to deliver energy return with every stride.",
  },
  {
    "id": "4",
    "brand": "Adidas",
    "name": "Adidas ZX 2K Boost",
    "images": [
      "https://example.com/shoes/adidas-zx2k-1.png",
      "https://example.com/shoes/adidas-zx2k-2.png",
      "https://example.com/shoes/adidas-zx2k-3.png",
    ],
    "rating": 4.5,
    "reviews": 1045,
    "price": 235.00,
    "sizes": [39, 40, 40.5, 41],
    "colors": ["#9E9E9E", "#616161", "#FFFFFF"],
    "description":
        "Blending heritage design with modern comfort, these shoes feature a mesh upper and Boost midsole for energy return.",
  },
  {
    "id": "5",
    "brand": "Vans",
    "name": "Vans Sk8-Hi Retro",
    "images": [
      "https://example.com/shoes/vans-sk8hi-1.png",
      "https://example.com/shoes/vans-sk8hi-2.png",
      "https://example.com/shoes/vans-sk8hi-3.png",
    ],
    "rating": 4.5,
    "reviews": 1045,
    "price": 235.00,
    "sizes": [39, 40, 41],
    "colors": ["#1B5E20", "#000000", "#FFFFFF"],
    "description":
        "Iconic high-top sneakers with sturdy canvas uppers, reinforced toe caps, and signature rubber waffle outsoles.",
  },
  {
    "id": "6",
    "brand": "Reebok",
    "name": "Reebok Zig Kinetica",
    "images": [
      "https://example.com/shoes/reebok-zig-1.png",
      "https://example.com/shoes/reebok-zig-2.png",
      "https://example.com/shoes/reebok-zig-3.png",
    ],
    "rating": 4.5,
    "reviews": 1045,
    "price": 235.00,
    "sizes": [39, 39.5, 40, 41],
    "colors": ["#BDBDBD", "#212121", "#FFFFFF"],
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
