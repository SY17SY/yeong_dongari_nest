import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yeong_dongari_nest/common/util/firebase_utils.dart';
import 'package:yeong_dongari_nest/feature/authentication/repo/auth_repo.dart';
import 'package:yeong_dongari_nest/feature/home/view/home_screen.dart';

class LoginViewModel extends AsyncNotifier<void> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _authRepository = ref.read(authRepo);
  }

  Future<void> login(BuildContext context, Map<String, String> formData) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final email = formData['email']!;
      final password = formData['password']!;
      await _authRepository.logIn(email, password);
    });

    if (!context.mounted) return;
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.go(HomeScreen.routeUrl);
    }
  }
}

final loginProvider = AsyncNotifierProvider<LoginViewModel, void>(
  () => LoginViewModel(),
);
