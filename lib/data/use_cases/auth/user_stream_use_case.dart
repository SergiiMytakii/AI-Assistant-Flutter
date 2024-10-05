import 'package:injectable/injectable.dart';
import 'package:my_template/domain/entities/user.dart';
import 'package:my_template/domain/repositories/auth_repository.dart';

@injectable
class UserStreamUseCase {
  final AuthenticationRepository _repository;

  UserStreamUseCase(this._repository);

  Future<User?> call() {
    return _repository.user;
  }
}
