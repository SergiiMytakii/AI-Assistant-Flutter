import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ai_assiatant_flutter/core/errors/failures.dart';
import 'package:ai_assiatant_flutter/domain/entities/user.dart';
import 'package:ai_assiatant_flutter/domain/repositories/auth_repository.dart';

@injectable
class SignUpUseCase {
  final AuthenticationRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, User>> call(
      {required String email, required String password}) {
    return repository.signUp(email: email, password: password);
  }
}
