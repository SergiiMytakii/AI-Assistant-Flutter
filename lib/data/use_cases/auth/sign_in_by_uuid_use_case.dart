import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ai_assiatant_flutter/core/errors/failures.dart';
import 'package:ai_assiatant_flutter/domain/entities/user/user.dart';
import 'package:ai_assiatant_flutter/domain/repositories/auth_repository.dart';

@injectable
class SignInByUuidUseCase {
  final AuthenticationRepository repository;

  SignInByUuidUseCase(this.repository);

  Future<Either<Failure, User>> call({required String uuid}) {
    return repository.signInByUuid(uuid: uuid);
  }
}
