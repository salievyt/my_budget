import 'package:equatable/equatable.dart';

enum Rarity {
  common,
  rare,
  epic,
  legendary,
  exclusive,
}

enum BadgeCategory {
  conference,
  forum,
  hackathon,
  festival,
  exhibition,
  educational,
  business,
  other,
}

enum BadgeClaimMethod {
  qrCode,
  nfc,
  geolocation,
  manual,
}

class Badge extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String organizerId;
  final String organizerName;
  final BadgeCategory category;
  final Rarity rarity;
  final DateTime obtainedAt;
  final String eventId;
  final String eventName;

  const Badge({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.organizerId,
    required this.organizerName,
    required this.category,
    required this.rarity,
    required this.obtainedAt,
    required this.eventId,
    required this.eventName,
  });

  Badge copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    String? organizerId,
    String? organizerName,
    BadgeCategory? category,
    Rarity? rarity,
    DateTime? obtainedAt,
    String? eventId,
    String? eventName,
  }) {
    return Badge(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      organizerId: organizerId ?? this.organizerId,
      organizerName: organizerName ?? this.organizerName,
      category: category ?? this.category,
      rarity: rarity ?? this.rarity,
      obtainedAt: obtainedAt ?? this.obtainedAt,
      eventId: eventId ?? this.eventId,
      eventName: eventName ?? this.eventName,
    );
  }

  @override
  List<Object?> get props => [id];
}
