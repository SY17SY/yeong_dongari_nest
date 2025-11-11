import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/feature/post/model/event_model.dart';
import 'package:yeong_dongari_nest/feature/post/repo/event_repo.dart';

class EventsViewModel extends StreamNotifier<List<EventModel>> {
  late final EventRepository _eventRepository;

  @override
  Stream<List<EventModel>> build() {
    _eventRepository = ref.read(eventRepository);
    return _eventRepository.getEvents();
  }

  Future<void> deleteEvent(String eventId) async {
    await _eventRepository.deleteEvent(eventId);
  }
}

final eventsProvider =
    StreamNotifierProvider<EventsViewModel, List<EventModel>>(
      () => EventsViewModel(),
    );
