import 'package:equatable/equatable.dart';

enum ChatType {
  direct,
  group,
}

enum MessageType {
  text,
  file,
  contact,
}

class Chat extends Equatable {
  final String id;
  final ChatType type;
  final String? name;
  final String? imageUrl;
  final List<String> participantIds;
  final DateTime lastMessageAt;
  final String? lastMessage;
  final int unreadCount;

  Chat({
    required this.id,
    required this.type,
    this.name,
    this.imageUrl,
    List<String>? participantIds,
    required this.lastMessageAt,
    this.lastMessage,
    this.unreadCount = 0,
  }) : participantIds = participantIds ?? [];

  bool get isDirect => type == ChatType.direct;
  bool get isGroup => type == ChatType.group;

  Chat copyWith({
    String? id,
    ChatType? type,
    String? name,
    String? imageUrl,
    List<String>? participantIds,
    DateTime? lastMessageAt,
    String? lastMessage,
    int? unreadCount,
  }) {
    return Chat(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      participantIds: participantIds ?? this.participantIds,
      lastMessageAt: lastMessageAt ?? this.lastMessageAt,
      lastMessage: lastMessage ?? this.lastMessage,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }

  @override
  List<Object?> get props => [id];
}

class Message extends Equatable {
  final String id;
  final String chatId;
  final String senderId;
  final MessageType messageType;
  final String text;
  final String? fileUrl;
  final String? fileName;
  final String? contactName;
  final String? contactPhone;
  final DateTime sentAt;
  final DateTime? readAt;

  const Message({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.messageType,
    required this.text,
    this.fileUrl,
    this.fileName,
    this.contactName,
    this.contactPhone,
    required this.sentAt,
    this.readAt,
  });

  bool get isText => messageType == MessageType.text;
  bool get isFile => messageType == MessageType.file;
  bool get isContact => messageType == MessageType.contact;
  bool get isRead => readAt != null;

  Message copyWith({
    String? id,
    String? chatId,
    String? senderId,
    MessageType? messageType,
    String? text,
    String? fileUrl,
    String? fileName,
    String? contactName,
    String? contactPhone,
    DateTime? sentAt,
    DateTime? readAt,
  }) {
    return Message(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      senderId: senderId ?? this.senderId,
      messageType: messageType ?? this.messageType,
      text: text ?? this.text,
      fileUrl: fileUrl ?? this.fileUrl,
      fileName: fileName ?? this.fileName,
      contactName: contactName ?? this.contactName,
      contactPhone: contactPhone ?? this.contactPhone,
      sentAt: sentAt ?? this.sentAt,
      readAt: readAt ?? this.readAt,
    );
  }

  @override
  List<Object?> get props => [id];
}
