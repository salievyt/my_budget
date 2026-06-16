import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/chat.dart';
import 'package:my_badge/domain/repositories/chat_repository.dart';
import 'package:equatable/equatable.dart';

class SendMessageParams extends Equatable {
  final String chatId;
  final String text;
  final MessageType messageType;
  final String? fileUrl;
  final String? fileName;
  final String? contactName;
  final String? contactPhone;

  const SendMessageParams({
    required this.chatId,
    required this.text,
    this.messageType = MessageType.text,
    this.fileUrl,
    this.fileName,
    this.contactName,
    this.contactPhone,
  });

  @override
  List<Object?> get props => [
    chatId,
    text,
    messageType,
    fileUrl,
    fileName,
    contactName,
    contactPhone,
  ];
}

class SendMessageUsecase {
  final ChatRepository repository;

  SendMessageUsecase(this.repository);

  Future<Either<Failure, Message>> call(SendMessageParams params) async {
    try {
      final message = await repository.sendMessage(
        chatId: params.chatId,
        text: params.text,
        messageType: params.messageType,
        fileUrl: params.fileUrl,
        fileName: params.fileName,
        contactName: params.contactName,
        contactPhone: params.contactPhone,
      );
      return Right(message);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
