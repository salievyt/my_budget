import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/ticket.dart';
import 'package:my_badge/domain/repositories/ticket_repository.dart';
import 'package:equatable/equatable.dart';

class PurchaseTicketParams extends Equatable {
  final String eventId;
  final String userId;

  const PurchaseTicketParams({
    required this.eventId,
    required this.userId,
  });

  @override
  List<Object?> get props => [eventId, userId];
}

class PurchaseTicketUsecase {
  final TicketRepository repository;

  PurchaseTicketUsecase(this.repository);

  Future<Either<Failure, Ticket>> call(PurchaseTicketParams params) async {
    try {
      final ticket = await repository.purchaseTicket(
        eventId: params.eventId,
        userId: params.userId,
      );
      return Right(ticket);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
