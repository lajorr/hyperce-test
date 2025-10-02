import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hyperce_test/firebase_options.dart';
import 'package:injectable/injectable.dart';

@module // external dependencies
abstract class FirebaseConfig {
  @preResolve // this is completed before di
  Future<FirebaseApp> get firebaseApp =>
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
