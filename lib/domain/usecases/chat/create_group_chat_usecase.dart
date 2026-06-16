import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/chat.dart';
import 'package:my_badge/domain/repositories/chat_repository.dart';
import 'package:equatable/equatable.dart';

class CreateGroupChatParams extends Equatable {
  final String name;
  final List<String> participantIds;
  final String? imageUrl;

  const CreateGroupChatParams({
    required this.name,
    this.participantIds = const [],
    this.imageUrl,
  });

  @override
  List<Object?> get props => [name, participantIds, imageUrl];
}

class CreateGroupChatUsecase {
  final ChatRepository repository;

  CreateGroupChatUsecase(this.repository);

  Future<Either<Failure, Chat>> call(CreateGroupChatParams params) async {
    try {
      final chat = await repository.createGroupChat(
        name: params.name,
        participantIds: params.participantIds,
        imageUrl: params.imageUrl,
      );
      return Right(chat);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
