import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_template/core/errors/failures.dart';
import 'package:my_template/domain/entities/user.dart';
import 'package:my_template/domain/repositories/auth_repository.dart';

@injectable
class SignInUseCase {
  final AuthenticationRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, User>> call(
      {required String email, required String password}) {
    return repository.signIn(email: email, password: password);
  }
}
