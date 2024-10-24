import 'package:injectable/injectable.dart';
import 'package:ai_assiatant_flutter/domain/entities/user/user.dart';
import 'package:ai_assiatant_flutter/domain/repositories/auth_repository.dart';

@injectable
class UserStreamUseCase {
  final AuthenticationRepository _repository;

  UserStreamUseCase(this._repository);

  Future<User?> call() {
    return _repository.user;
  }
}
