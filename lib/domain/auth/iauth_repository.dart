abstract interface class IAuthRepository {
  Future<bool> login({required String login, required String password});
}
