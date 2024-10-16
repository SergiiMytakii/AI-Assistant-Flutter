import 'package:injectable/injectable.dart';
import 'package:ai_assiatant_flutter/domain/repositories/auth_repository.dart';

@injectable
class SignOutUseCase {
  final AuthenticationRepository repository;

  SignOutUseCase(this.repository);

  Future<void> call() {
    return repository.signOut();
  }
}
