import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hyperce_test/core/error/exception.dart';
import 'package:hyperce_test/feature/catalog/data/model/shoe_model.dart';
import 'package:injectable/injectable.dart';

abstract interface class CatalogRemoteDatasource {
  Future<List<ShoeModel>> fetchShoesData();
}

const String shoesCollection = 'shoe_list';

@LazySingleton(as: CatalogRemoteDatasource)
final class CatalogRemoteDatasourceImpl implements CatalogRemoteDatasource {
  final FirebaseFirestore firestore;

  CatalogRemoteDatasourceImpl({required this.firestore});

  @override
  Future<List<ShoeModel>> fetchShoesData() async {
    try {
      final snapshop = await firestore.collection(shoesCollection).get();
      log(snapshop.docs.toString(), name: "snaphot");
      log(snapshop.docs[0].toString(), name: "snaphot");
      log(snapshop.docs[0].data().toString(), name: "snaphot");
      return snapshop.docs
          .map((doc) => ShoeModel.fromJson(doc.data()))
          .toList();
    } catch (e,s) {
      log(e.toString());
      log(s.toString());
      throw ServerException();
    }
  }
}
