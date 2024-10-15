import 'dart:async';

import 'package:ai_assiatant_flutter/core/constants/constants.dart';
import 'package:ai_assiatant_flutter/domain/data_sources/firebase_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:injectable/injectable.dart';
import 'package:ai_assiatant_flutter/core/errors/failures.dart';
import 'package:ai_assiatant_flutter/domain/repositories/auth_repository.dart';

import '../../domain/entities/user/user.dart';

@dev
@prod
@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseDataSource _firebaseDataSource;
  final firebase.FirebaseAuth _firebaseAuth;

  AuthenticationRepositoryImpl(this._firebaseDataSource)
      : _firebaseAuth = firebase.FirebaseAuth.instance;

  @override
  Future<User?> get user => _firebaseAuth.authStateChanges().first.then(
        (firebaseUser) => firebaseUser != null
            ? User(id: firebaseUser.uid, email: firebaseUser.email!)
            : null,
      );

  @override
  Future<Either<Failure, User>> signUp(
      {required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _firebaseDataSource.postToFirebaseDB(
          collectionName: FirebaseCollections.users.name,
          data: {
            'email': userCredential.user!.email!,
            'id': userCredential.user!.uid,
            'createdAt': DateTime.now().toIso8601String()
          });

      return right(User(
          id: userCredential.user!.uid, email: userCredential.user!.email!));
    } on firebase.FirebaseAuthException catch (e) {
      return left(Failure.authenticationError(errorMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signIn(
      {required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(User(
          id: userCredential.user!.uid, email: userCredential.user!.email!));
    } on firebase.FirebaseAuthException catch (e) {
      return left(Failure.authenticationError(errorMessage: e.message));
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
