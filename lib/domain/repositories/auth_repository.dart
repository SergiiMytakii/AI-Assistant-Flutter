import 'package:dartz/dartz.dart';
import '../entities/user.dart';

abstract class AuthenticationRepository {
  Future<User?> get user;

  Future<Either<String, User>> signUp(
      {required String email, required String password});

  Future<Either<String, User>> signIn(
      {required String email, required String password});

  Future<void> signOut();
}
