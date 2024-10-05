import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_template/domain/entities/user.dart';
import 'package:my_template/domain/repositories/auth_repository.dart';

@injectable
class SignUpUseCase {
  final AuthenticationRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<String, User>> call(
      {required String email, required String password}) {
    return repository.signUp(email: email, password: password);
  }
}
