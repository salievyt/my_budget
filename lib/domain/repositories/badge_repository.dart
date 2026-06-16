import 'package:my_badge/domain/entities/badge.dart';

abstract class BadgeRepository {
  Future<List<Badge>> getBadges({
    String? userId,
    BadgeCategory? category,
    Rarity? rarity,
  });
  Future<Badge> claimBadge({
    required String qrCode,
    String? eventId,
  });
  Future<Badge> claimBadgeByNfc(String nfcTagId);
  Future<Badge> claimBadgeByGeolocation(String eventId);
  Future<List<BadgeCategory>> getBadgeCategories();
  Future<List<Rarity>> getRarityLevels();
  Future<Badge> getBadgeById(String badgeId);
  Future<int> getBadgeCount({String? userId});
}
