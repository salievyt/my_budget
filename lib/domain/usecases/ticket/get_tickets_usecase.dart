import 'package:my_badge/core/either.dart';
import 'package:my_badge/core/errors/failures.dart';
import 'package:my_badge/domain/entities/ticket.dart';
import 'package:my_badge/domain/repositories/ticket_repository.dart';
import 'package:equatable/equatable.dart';

class GetTicketsParams extends Equatable {
  final TicketStatus? status;
  final String? userId;

  const GetTicketsParams({this.status, this.userId});

  @override
  List<Object?> get props => [status, userId];
}

class GetTicketsUsecase {
  final TicketRepository repository;

  GetTicketsUsecase(this.repository);

  Future<Either<Failure, List<Ticket>>> call(GetTicketsParams params) async {
    try {
      final tickets = await repository.getTickets(
        status: params.status,
        userId: params.userId,
      );
      return Right(tickets);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
