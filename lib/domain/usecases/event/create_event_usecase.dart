import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/event.dart';
import 'package:my_badge/domain/repositories/event_repository.dart';

class CreateEventUsecase {
  final EventRepository repository;

  CreateEventUsecase(this.repository);

  Future<Either<Failure, Event>> call(Event event) async {
    try {
      final created = await repository.createEvent(event);
      return Right(created);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
