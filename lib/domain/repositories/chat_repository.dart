import 'package:my_badge/domain/entities/chat.dart';

abstract class ChatRepository {
  Future<List<Chat>> getChats();
  Future<Chat> getChatById(String chatId);
  Future<List<Chat>> getDirectChats();
  Future<List<Chat>> getGroupChats();
  Future<Chat> createGroupChat({
    required String name,
    List<String> participantIds = const [],
    String? imageUrl,
  });
  Future<Message> sendMessage({
    required String chatId,
    required String text,
    MessageType messageType = MessageType.text,
    String? fileUrl,
    String? fileName,
    String? contactName,
    String? contactPhone,
  });
  Future<void> deleteMessage(String messageId);
  Future<void> markMessageAsRead(String messageId);
  Future<void> markChatAsRead(String chatId);
  Future<void> leaveGroupChat(String chatId);
}
