import 'dart:io';

import 'package:ai_assiatant_flutter/main.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import 'package:ai_assiatant_flutter/domain/data_sources/firebase_data_source.dart';

@dev
@prod
@Injectable(as: FirebaseDataSource)
class FirebaseDataSourceImpl implements FirebaseDataSource {
  final db = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();

  FirebaseDataSourceImpl() {
    db.settings = const Settings(persistenceEnabled: true);
  }

  //get songs
  @override
  Future<QuerySnapshot> getFromFirebaseDB({
    required String collectionName,
    Map<String, dynamic>? filters,
    Map<String, dynamic>? search,
    Map<String, bool>? orderBy,
  }) async {
    try {
      Query query = db.collection(collectionName);

      if (filters != null && filters.isNotEmpty) {
        for (var filter in filters.entries) {
          query = query.where(filter.key, isEqualTo: filter.value);
        }
      }
      if (search != null && search.isNotEmpty) {
        for (var search in search.entries) {
          query = query.where(search.key, arrayContains: search.value);
        }
      }

      if (orderBy != null && orderBy.isNotEmpty) {
        return query
            .orderBy(orderBy.entries.first.key,
                descending: orderBy.entries.first.value)
            .get();
      } else {
        return await query.get();
      }
    } on FirebaseException catch (e, stackTrace) {
      logger.e(e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<DocumentSnapshot> getOneFromFirebaseDB(
      {required String collectionName,
      Map<String, dynamic>? fields,
      required String docReference}) async {
    try {
      final CollectionReference collection = db.collection(collectionName);
      final DocumentReference documentRef = collection.doc(docReference);
      return await documentRef.get();
    } on FirebaseException catch (e, stackTrace) {
      logger.e(e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<QuerySnapshot> updateToFirebaseDB(
      {required String collectionName,
      required String id,
      required Map<String, dynamic> data}) async {
    try {
      final CollectionReference collection = db.collection(collectionName);
      final DocumentReference documentRef = collection.doc(id);
      await documentRef.update(data);
      final QuerySnapshot snapshot = await collection.get();
      return snapshot;
    } on FirebaseException catch (e, stackTrace) {
      logger.e(e, stackTrace: stackTrace);
      rethrow;
    }
  }

//replace  existing document with new one
  @override
  Future<QuerySnapshot> postToFirebaseDB(
      {required String collectionName,
      required Map<String, dynamic> data,
      String? docReference}) async {
    try {
      final CollectionReference collection = db.collection(collectionName);

      final DocumentReference documentRef =
          collection.doc(docReference ?? data['id'].toString());
      await documentRef.set(data, SetOptions(merge: true));
      final QuerySnapshot snapshot = await collection.get();
      return snapshot;
    } on FirebaseException catch (e, stackTrace) {
      logger.e(e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<QuerySnapshot> deleteFromFirebaseDB(
      {required String collectionName, required String id}) async {
    try {
      final CollectionReference collection = db.collection(collectionName);
      final DocumentReference documentRef = collection.doc(id.toString());
      await documentRef.delete();
      final QuerySnapshot snapshot = await collection.get();
      return snapshot;
    } on FirebaseException catch (e, stackTrace) {
      logger.e(e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<String> uploadFileToFirebaseStorage(String folder, File file) async {
    final docsRef = storageRef.child(folder);
    try {
      await docsRef.putFile(file);
      return await docsRef.getDownloadURL();
    } on FirebaseException catch (e, stackTrace) {
      logger.e(e, stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<File> downloadFileFromFirebaseStorage(String folder, File file) async {
    final docsRef = storageRef.child(folder);
    try {
      //todo implement download file
      return File(docsRef.fullPath);
    } on FirebaseException catch (e, stackTrace) {
      logger.e(e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
