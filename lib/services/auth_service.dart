import 'package:todo_list_app/repositories/auth_repository.dart';

class AuthService {
  late AuthRepository _authRepository;

  AuthService() {
    _authRepository = AuthRepositoryImpl();
  }

  Future<void> loginUser({required String username, required String password}) async {
    return _authRepository.loginUser(username: username, password: password);
  }
}
