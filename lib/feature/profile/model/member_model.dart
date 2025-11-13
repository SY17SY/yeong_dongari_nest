import 'package:cloud_firestore/cloud_firestore.dart';

class MemberModel {
  final String id;
  final String uid;
  final String clubId;
  final String name;
  final bool isAdmin;
  final Timestamp joinedAt;

  MemberModel({
    required this.id,
    required this.uid,
    required this.clubId,
    required this.name,
    this.isAdmin = false,
    required this.joinedAt,
  });

  MemberModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      uid = json['uid'],
      clubId = json['clubId'],
      name = json['name'],
      isAdmin = json['isAdmin'],
      joinedAt = json['joinedAt'] as Timestamp;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'clubId': clubId,
      'name': name,
      'isAdmin': isAdmin,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}
