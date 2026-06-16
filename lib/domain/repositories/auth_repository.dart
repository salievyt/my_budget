import 'package:my_badge/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? nickname,
  });
  Future<void> logout();
  Future<User> loginWithGoogle();
  Future<User> loginWithApple();
  Future<User> loginWithTelegram(String authorizationToken);
  Future<User> loginWithLinkedIn({
    required String code,
    required String redirectUri,
  });
  Future<void> resetPassword(String email);
  Future<void> deleteAccount();
  Future<User?> getCurrentUser();
}
