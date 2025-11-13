import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/feature/authentication/model/user_model.dart';
import 'package:yeong_dongari_nest/feature/authentication/repo/auth_repo.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final Ref _ref;

  UserRepository(this._ref);

  String? get _currentUserId => _ref.read(authRepo).user?.uid;

  Future<void> createUser(UserModel user) async {
    if (_currentUserId == null) {
      throw Exception("User not authenticated");
    }
    if (user.uid != _currentUserId) {
      throw Exception("Unauthrozied: Cannot create user for another user id");
    }

    try {
      await _db.collection("users").doc(user.uid).set(user.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUserFiles(String uid) async {
    if (_currentUserId == null) {
      throw Exception("User not authenticated");
    }
    if (uid != _currentUserId) {
      throw Exception("Unauthrozied: Cannot delete another user's files");
    }

    try {
      final ref = _storage.ref().child("/posts/$uid/");
      final ListResult result = await ref.listAll();

      for (Reference dirRef in result.prefixes) {
        final ListResult dirResult = await dirRef.listAll();
        for (Reference fileRef in dirResult.items) {
          await fileRef.delete();
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUser(String uid) async {
    if (_currentUserId == null) {
      throw Exception("User not authenticated");
    }
    if (uid != _currentUserId) {
      throw Exception("Unauthorized: Cannot delete another user's account");
    }

    try {
      await _db.collection("users").doc(uid).delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> getCurrentUser() async {
    if (_currentUserId == null) return null;

    try {
      final doc = await _db.collection("users").doc(_currentUserId).get();
      if (!doc.exists) return null;

      return UserModel.fromJson(doc.data()!);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> getUserById(String uid) async {
    if (_currentUserId == null) {
      throw Exception("User not authenticated");
    }

    try {
      final doc = await _db.collection("users").doc(uid).get();
      if (!doc.exists) return null;

      return UserModel.fromJson(doc.data()!);
    } catch (e) {
      rethrow;
    }
  }
}

final userRepo = Provider((ref) => UserRepository(ref));
