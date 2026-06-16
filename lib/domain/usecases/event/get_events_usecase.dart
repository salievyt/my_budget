import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/event.dart';
import 'package:my_badge/domain/repositories/event_repository.dart';

class GetEventsUsecase {
  final EventRepository repository;

  GetEventsUsecase(this.repository);

  Future<Either<Failure, List<Event>>> call() async {
    try {
      final events = await repository.getEvents();
      return Right(events);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
