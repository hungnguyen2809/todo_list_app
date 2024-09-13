abstract interface class AuthRepository {
  Future<void> loginUser({required String username, required String password});
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> loginUser({required String username, required String password}) async {
    print("Username: $username , Password: $password");
    await Future.delayed(const Duration(seconds: 2));

    if (username != 'admin' || password != 'admin') {
      throw Exception("Username or Password incorrect");
    }
  }
}
