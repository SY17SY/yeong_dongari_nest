import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/feature/feed/model/event_model.dart';

class EventRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<EventModel>> getEvents() {
    final query = _db
        .collection("events")
        .orderBy("createdAt", descending: true)
        .snapshots();
    return query.map(
      (event) => event.docs
          .map((doc) => EventModel.fromJson(doc.data(), eventId: doc.id))
          .toList(),
    );
  }

  Future<void> deleteEvent(String eventId) async {}
}

final eventRepository = Provider((ref) => EventRepository());
