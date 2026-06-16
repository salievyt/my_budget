import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/chat.dart';
import 'package:my_badge/domain/repositories/chat_repository.dart';

class GetChatsUsecase {
  final ChatRepository repository;

  GetChatsUsecase(this.repository);

  Future<Either<Failure, List<Chat>>> call() async {
    try {
      final chats = await repository.getChats();
      return Right(chats);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
