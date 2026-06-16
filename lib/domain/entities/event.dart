import 'package:equatable/equatable.dart';

enum EventCategory {
  conference,
  forum,
  hackathon,
  festival,
  exhibition,
  educational,
  business,
  other,
}

enum EventType {
  offline,
  online,
}

class Event extends Equatable {
  final String id;
  final String title;
  final String? bannerUrl;
  final String description;
  final String organizerId;
  final String organizerName;
  final String? location;
  final double? latitude;
  final double? longitude;
  final DateTime startDate;
  final DateTime? endDate;
  final double price;
  final EventCategory category;
  final EventType type;
  final int participantsCount;
  final double rating;
  final String? imageUrl;

  const Event({
    required this.id,
    required this.title,
    this.bannerUrl,
    required this.description,
    required this.organizerId,
    required this.organizerName,
    this.location,
    this.latitude,
    this.longitude,
    required this.startDate,
    this.endDate,
    this.price = 0.0,
    required this.category,
    required this.type,
    this.participantsCount = 0,
    this.rating = 0.0,
    this.imageUrl,
  });

  bool get isFree => price <= 0;

  Event copyWith({
    String? id,
    String? title,
    String? bannerUrl,
    String? description,
    String? organizerId,
    String? organizerName,
    String? location,
    double? latitude,
    double? longitude,
    DateTime? startDate,
    DateTime? endDate,
    double? price,
    EventCategory? category,
    EventType? type,
    int? participantsCount,
    double? rating,
    String? imageUrl,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      description: description ?? this.description,
      organizerId: organizerId ?? this.organizerId,
      organizerName: organizerName ?? this.organizerName,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      price: price ?? this.price,
      category: category ?? this.category,
      type: type ?? this.type,
      participantsCount: participantsCount ?? this.participantsCount,
      rating: rating ?? this.rating,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object?> get props => [id];
}

class EventFilters extends Equatable {
  final bool? isFreeOnly;
  final EventType? type;
  final String? city;
  final EventCategory? category;
  final DateTime? startDateFrom;
  final DateTime? startDateTo;

  const EventFilters({
    this.isFreeOnly,
    this.type,
    this.city,
    this.category,
    this.startDateFrom,
    this.startDateTo,
  });

  EventFilters copyWith({
    bool? isFreeOnly,
    EventType? type,
    String? city,
    EventCategory? category,
    DateTime? startDateFrom,
    DateTime? startDateTo,
  }) {
    return EventFilters(
      isFreeOnly: isFreeOnly ?? this.isFreeOnly,
      type: type ?? this.type,
      city: city ?? this.city,
      category: category ?? this.category,
      startDateFrom: startDateFrom ?? this.startDateFrom,
      startDateTo: startDateTo ?? this.startDateTo,
    );
  }

  @override
  List<Object?> get props => [isFreeOnly, type, city, category, startDateFrom, startDateTo];
}
