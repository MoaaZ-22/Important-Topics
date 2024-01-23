class AuthRepository {
  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
