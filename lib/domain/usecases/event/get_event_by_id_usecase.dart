import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/event.dart';
import 'package:my_badge/domain/repositories/event_repository.dart';
import 'package:equatable/equatable.dart';

class GetEventByIdParams extends Equatable {
  final String eventId;

  const GetEventByIdParams({required this.eventId});

  @override
  List<Object?> get props => [eventId];
}

class GetEventByIdUsecase {
  final EventRepository repository;

  GetEventByIdUsecase(this.repository);

  Future<Either<Failure, Event>> call(GetEventByIdParams params) async {
    try {
      final event = await repository.getEventById(params.eventId);
      return Right(event);
    } catch (e) {
      return Left(NotFoundFailure('Event not found'));
    }
  }
}
