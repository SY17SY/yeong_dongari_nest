import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yeong_dongari_nest/feature/profile/model/member_model.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final List<MemberModel> members;
  final Timestamp createdAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.members,
    required this.createdAt,
  });

  UserModel.fromJson(Map<String, dynamic> json)
    : uid = json['uid'],
      name = json['name'],
      email = json['email'],
      members = json['members'],
      createdAt = json['createdAt'] as Timestamp;

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'members': members,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}
