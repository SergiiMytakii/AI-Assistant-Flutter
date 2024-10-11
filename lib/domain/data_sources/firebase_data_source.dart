import 'package:ai_assiatant_flutter/domain/entities/user.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

abstract class FirebaseDataSource {
  Future<QuerySnapshot> getFromFirebase(
    String collection, {
    Map<String, dynamic>? filters,
    Map<String, dynamic>? search,
    Map<String, bool>? orderBy,
  });
  Future<QuerySnapshot> updateToFirebase(
      User user, String collection, String id, Map<String, dynamic> data);

  Future<QuerySnapshot> postToFirebase(
      User? user, String collection, Map<String, dynamic> data,
      {String? docReference});

  Future<QuerySnapshot> addToFirebase(
    User? user,
    String collection,
    Map<String, dynamic> data,
  );

  Future<QuerySnapshot> deleteToFirebase(
      User? user, String collection, String id);
}
