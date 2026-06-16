import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/repositories/ticket_repository.dart';
import 'package:equatable/equatable.dart';

class CancelTicketParams extends Equatable {
  final String ticketId;

  const CancelTicketParams({required this.ticketId});

  @override
  List<Object?> get props => [ticketId];
}

class CancelTicketUsecase {
  final TicketRepository repository;

  CancelTicketUsecase(this.repository);

  Future<Either<Failure, void>> call(CancelTicketParams params) async {
    try {
      await repository.cancelTicket(params.ticketId);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
