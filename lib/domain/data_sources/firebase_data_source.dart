import 'dart:io';

import 'package:ai_assiatant_flutter/domain/entities/user/user.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

abstract class FirebaseDataSource {
  Future<QuerySnapshot> getFromFirebaseDB({
    required String collectionName,
    Map<String, dynamic>? filters,
    Map<String, dynamic>? search,
    Map<String, bool>? orderBy,
  });
  Future<QuerySnapshot> updateToFirebaseDB(
      {required String collectionName,
      required String id,
      required Map<String, dynamic> data});

  Future<QuerySnapshot> postToFirebaseDB(
      {required String collectionName,
      required Map<String, dynamic> data,
      String? docReference});

  Future<QuerySnapshot> deleteFromFirebaseDB(
      {required String collectionName, required String id});

  Future<DocumentSnapshot> getOneFromFirebaseDB(
      {required String collectionName,
      Map<String, dynamic>? fields,
      required String docReference});

  Future<String> uploadFileToFirebaseStorage(String folder, File file);
  Future<File> downloadFileFromFirebaseStorage(String folder, File file);
}
