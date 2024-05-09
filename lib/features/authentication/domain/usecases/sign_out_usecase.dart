import 'package:test_app/features/authentication/domain/entities/sign_out_entity.dart';
import 'package:test_app/features/authentication/domain/repositories/authentication_repository.dart';

class SignOutUseCase {
  final AuthenticationRepository repository;

  SignOutUseCase(this.repository);

  Future<void> call(SignOutEntity signOutEntity) async {
    return await repository.signOut(signOutEntity);
  }
}
