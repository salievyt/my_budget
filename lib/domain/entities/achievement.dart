import 'package:equatable/equatable.dart';

class Achievement extends Equatable {
  final String id;
  final String title;
  final String description;
  final String? iconUrl;
  final AchievementType type;
  final int requiredValue;
  final int currentValue;
  final bool isUnlocked;
  final DateTime? unlockedAt;

  const Achievement({
    required this.id,
    required this.title,
    required this.description,
    this.iconUrl,
    required this.type,
    required this.requiredValue,
    this.currentValue = 0,
    this.isUnlocked = false,
    this.unlockedAt,
  });

  bool get isCompleted => isUnlocked;
  double get progress => requiredValue > 0 ? (currentValue / requiredValue).clamp(0.0, 1.0) : 0.0;

  Achievement copyWith({
    String? id,
    String? title,
    String? description,
    String? iconUrl,
    AchievementType? type,
    int? requiredValue,
    int? currentValue,
    bool? isUnlocked,
    DateTime? unlockedAt,
  }) {
    return Achievement(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      iconUrl: iconUrl ?? this.iconUrl,
      type: type ?? this.type,
      requiredValue: requiredValue ?? this.requiredValue,
      currentValue: currentValue ?? this.currentValue,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      unlockedAt: unlockedAt ?? this.unlockedAt,
    );
  }

  @override
  List<Object?> get props => [id];
}

enum AchievementType {
  firstBadge,
  eventsCount,
  internationalParticipant,
  hackathonWinner,
  socialGrowth,
  badgeCollection,
  organizer,
  ticketPurchase,
}
