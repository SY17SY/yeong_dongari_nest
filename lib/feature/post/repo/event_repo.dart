import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/feature/post/model/event_model.dart';

class EventRepository {
  Stream<List<EventModel>> getEvents() {
    Stream<List<EventModel>> events = Stream.value([]);
    return events;
  }

  Future<void> deleteEvent(String eventId) async {}
}

final eventRepository = Provider((ref) => EventRepository());
