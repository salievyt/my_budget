import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/event.dart';
import 'package:my_badge/domain/repositories/event_repository.dart';

class FilterEventsUsecase {
  final EventRepository repository;

  FilterEventsUsecase(this.repository);

  Future<Either<Failure, List<Event>>> call(EventFilters filters) async {
    try {
      final events = await repository.filterEvents(filters);
      return Right(events);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
