import 'package:equatable/equatable.dart';
import 'badge.dart';
import 'event.dart';
import 'user.dart';

enum ActivityType {
  newBadge,
  newEvent,
  popularEvent,
  recommendation,
  friendAchievement,
}

class Activity extends Equatable {
  final String id;
  final ActivityType type;
  final DateTime timestamp;
  final User? user;
  final Badge? badge;
  final Event? event;
  final String? message;

  const Activity({
    required this.id,
    required this.type,
    required this.timestamp,
    this.user,
    this.badge,
    this.event,
    this.message,
  });

  @override
  List<Object?> get props => [id];
}
