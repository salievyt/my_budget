import 'package:my_badge/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getProfile(String userId);
  Future<User> updateProfile(User profile);
  Future<List<UserProfileSummary>> searchUsers({
    String? query,
    String? city,
    String? company,
    List<String>? interests,
    String? badgeId,
  });
  Future<void> subscribeUser(String userId);
  Future<void> unsubscribeUser(String userId);
  Future<Map<String, dynamic>> getNetworkingRecommendations();
}
