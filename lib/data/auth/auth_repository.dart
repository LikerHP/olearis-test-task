import 'package:olearis_test_task/domain/auth/iauth_repository.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<bool> login({required String login, required String password}) async {
    return await Future.delayed(
      const Duration(seconds: 3),
      () {
        return true;
      },
    );
  }
}
