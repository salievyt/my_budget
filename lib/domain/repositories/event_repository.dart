import 'package:my_badge/domain/entities/event.dart';

abstract class EventRepository {
  Future<List<Event>> getEvents();
  Future<Event> getEventById(String eventId);
  Future<List<Event>> filterEvents(EventFilters filters);
  Future<Event> createEvent(Event event);
  Future<Event> updateEvent(Event event);
  Future<void> deleteEvent(String eventId);
  Future<List<Event>> getRecommendedEvents({
    int limit = 10,
    String? userId,
  });
  Future<List<Event>> getOrganizerEvents(String organizerId);
}
