import 'package:dartz/dartz.dart';
import 'package:my_template/core/errors/failures.dart';
import '../entities/user.dart';

abstract class AuthenticationRepository {
  Future<User?> get user;

  Future<Either<Failure, User>> signUp(
      {required String email, required String password});

  Future<Either<Failure, User>> signIn(
      {required String email, required String password});

  Future<void> signOut();
}
