import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/feature/authentication/model/user_model.dart';
import 'package:yeong_dongari_nest/feature/authentication/repo/auth_repo.dart';
import 'package:yeong_dongari_nest/feature/authentication/repo/user_repo.dart';

class UserViewModel extends AsyncNotifier<void> {
  late final UserRepository _userRepository;

  @override
  FutureOr<void> build() {
    _userRepository = ref.read(userRepo);
  }

  Future<void> createUser(
    UserCredential credential, {
    required String name,
  }) async {
    if (credential.user!.email == null) {
      throw Exception("Need Email to save user");
    }

    final user = UserModel(
      uid: credential.user!.uid,
      name: name,
      email: credential.user!.email!,
      members: List.empty(),
      createdAt: Timestamp.now(),
    );

    await _userRepository.createUser(user);
  }

  Future<void> deleteUser() async {
    final uid = ref.read(authRepo).user!.uid;
    await _userRepository.deleteUserFiles(uid);
    await _userRepository.deleteUser(uid);
  }
}

final userProvider = AsyncNotifierProvider<UserViewModel, void>(
  () => UserViewModel(),
);
