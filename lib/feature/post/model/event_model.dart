import 'package:flutter/material.dart';

class EventModel {
  String id;
  final String uid;
  final String name;
  final String title;
  final String? content;
  final String? thumbUrl;
  final List<String>? imgUrls;
  final int likes;
  final int comments;
  final List<String> participantIds;
  final DateTimeRange date;
  final String? place;
  final bool isNotice;
  final DateTime createdAt;

  EventModel({
    this.id = "",
    required this.uid,
    required this.name,
    required this.title,
    this.content,
    this.thumbUrl,
    this.imgUrls,
    this.likes = 0,
    this.comments = 0,
    required this.participantIds,
    required this.date,
    this.place = "",
    required this.isNotice,
    required this.createdAt,
  });

  EventModel.fromJson(Map<String, dynamic> json, {required String eventId})
    : id = eventId,
      uid = json["uid"],
      name = json["name"],
      title = json["title"],
      content = json["content"],
      thumbUrl = json["thumbUrl"] as String?,
      imgUrls = json["imgUrls"] != null
          ? List<String>.from(json["imgUrls"])
          : null,
      likes = json["likes"],
      comments = json["comments"],
      participantIds = json["participantIds"] != null
          ? List<String>.from(json["participantIds"])
          : [],
      date = json["date"],
      place = json["place"],
      isNotice = json["isNotice"],
      createdAt = json["createdAt"];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'title': title,
      'content': content,
      'thumbUrl': thumbUrl,
      'imgUrls': imgUrls,
      'likes': likes,
      'comments': comments,
      'participantIds': participantIds,
      'date': date,
      'place': place,
      'isNotice': isNotice,
      'createdAt': createdAt,
    };
  }
}
