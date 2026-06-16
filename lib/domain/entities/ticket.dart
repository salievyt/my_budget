import 'package:equatable/equatable.dart';

enum TicketStatus {
  purchased,
  used,
  cancelled,
  refunded,
}

class Ticket extends Equatable {
  final String id;
  final String eventId;
  final String eventName;
  final String userId;
  final double price;
  final TicketStatus status;
  final String? qrCode;
  final DateTime purchasedAt;
  final DateTime? usedAt;
  final DateTime? cancelledAt;

  const Ticket({
    required this.id,
    required this.eventId,
    required this.eventName,
    required this.userId,
    required this.price,
    required this.status,
    this.qrCode,
    required this.purchasedAt,
    this.usedAt,
    this.cancelledAt,
  });

  bool get isActive => status == TicketStatus.purchased;
  bool get isUsed => status == TicketStatus.used;
  bool get isCancelled => status == TicketStatus.cancelled || status == TicketStatus.refunded;

  Ticket copyWith({
    String? id,
    String? eventId,
    String? eventName,
    String? userId,
    double? price,
    TicketStatus? status,
    String? qrCode,
    DateTime? purchasedAt,
    DateTime? usedAt,
    DateTime? cancelledAt,
  }) {
    return Ticket(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      eventName: eventName ?? this.eventName,
      userId: userId ?? this.userId,
      price: price ?? this.price,
      status: status ?? this.status,
      qrCode: qrCode ?? this.qrCode,
      purchasedAt: purchasedAt ?? this.purchasedAt,
      usedAt: usedAt ?? this.usedAt,
      cancelledAt: cancelledAt ?? this.cancelledAt,
    );
  }

  @override
  List<Object?> get props => [id];
}
