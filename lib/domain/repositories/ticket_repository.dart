import 'package:my_badge/domain/entities/ticket.dart';

abstract class TicketRepository {
  Future<List<Ticket>> getTickets({
    TicketStatus? status,
    String? userId,
  });
  Future<Ticket> purchaseTicket({
    required String eventId,
    required String userId,
  });
  Future<void> cancelTicket(String ticketId);
  Future<Ticket> getTicketById(String ticketId);
  Future<void> validateTicket(String qrCode);
  Future<double> getEventPrice(String eventId);
}
