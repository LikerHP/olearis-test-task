import 'package:olearis_test_task/domain/auth/iauth_repository.dart';

class AuthUseCase {
  AuthUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  final IAuthRepository _authRepository;

  Future<bool> call({required String login, required String password}) async {
    return await _authRepository.login(login: login, password: password);
  }
}
