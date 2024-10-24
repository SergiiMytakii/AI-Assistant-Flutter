import 'package:dartz/dartz.dart';
import 'package:ai_assiatant_flutter/core/errors/failures.dart';
import '../entities/user/user.dart';

abstract class AuthenticationRepository {
  Future<User?> get user;

  Future<Either<Failure, User>> signUp(
      {required String email, required String password});

  Future<Either<Failure, User>> signIn(
      {required String email, required String password});
  Future<Either<Failure, User>> signInByUuid({required String uuid});

  Future<void> signOut();
}
