import 'package:equatable/equatable.dart';

enum AuthProvider {
  email,
  google,
  apple,
  telegram,
  linkedin,
}

class User extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String nickname;
  final String? bio;
  final String? avatarUrl;
  final String? city;
  final String? country;
  final String? email;
  final List<String> socialLinks;
  final int badgeCount;
  final int eventCount;
  final double rating;
  final int level;
  final int experience;
  final int followers;
  final int following;
  final bool isSubscribed;
  final DateTime createdAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.nickname,
    this.bio,
    this.avatarUrl,
    this.city,
    this.country,
    this.email,
    List<String>? socialLinks,
    this.badgeCount = 0,
    this.eventCount = 0,
    this.rating = 0.0,
    this.level = 1,
    this.experience = 0,
    this.followers = 0,
    this.following = 0,
    this.isSubscribed = false,
    required this.createdAt,
  }) : socialLinks = socialLinks ?? [];

  String get fullName => '$firstName $lastName';

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? nickname,
    String? bio,
    String? avatarUrl,
    String? city,
    String? country,
    String? email,
    List<String>? socialLinks,
    int? badgeCount,
    int? eventCount,
    double? rating,
    int? level,
    int? experience,
    int? followers,
    int? following,
    bool? isSubscribed,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      nickname: nickname ?? this.nickname,
      bio: bio ?? this.bio,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      city: city ?? this.city,
      country: country ?? this.country,
      email: email ?? this.email,
      socialLinks: socialLinks ?? this.socialLinks,
      badgeCount: badgeCount ?? this.badgeCount,
      eventCount: eventCount ?? this.eventCount,
      rating: rating ?? this.rating,
      level: level ?? this.level,
      experience: experience ?? this.experience,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      isSubscribed: isSubscribed ?? this.isSubscribed,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id];
}

class UserProfileSummary extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String nickname;
  final String? avatarUrl;
  final String? city;
  final String? country;
  final int badgeCount;
  final int eventCount;
  final double rating;
  final int followers;
  final int following;
  final bool isSubscribed;

  const UserProfileSummary({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.nickname,
    this.avatarUrl,
    this.city,
    this.country,
    this.badgeCount = 0,
    this.eventCount = 0,
    this.rating = 0.0,
    this.followers = 0,
    this.following = 0,
    this.isSubscribed = false,
  });

  String get fullName => '$firstName $lastName';

  UserProfileSummary copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? nickname,
    String? avatarUrl,
    String? city,
    String? country,
    int? badgeCount,
    int? eventCount,
    double? rating,
    int? followers,
    int? following,
    bool? isSubscribed,
  }) {
    return UserProfileSummary(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      nickname: nickname ?? this.nickname,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      city: city ?? this.city,
      country: country ?? this.country,
      badgeCount: badgeCount ?? this.badgeCount,
      eventCount: eventCount ?? this.eventCount,
      rating: rating ?? this.rating,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      isSubscribed: isSubscribed ?? this.isSubscribed,
    );
  }

  @override
  List<Object?> get props => [id];
}
