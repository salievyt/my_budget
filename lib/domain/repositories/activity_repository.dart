import 'package:my_badge/domain/entities/activity.dart';

abstract class ActivityRepository {
  Future<List<Activity>> getActivityFeed({
    int limit = 20,
    int offset = 0,
  });
  Future<List<Activity>> getFriendActivities({
    List<String> friendIds = const [],
    int limit = 20,
  });
  Future<void> markActivityAsRead(String activityId);
  Future<void> markAllActivitiesAsRead();
  Future<int> getUnreadCount();
}
