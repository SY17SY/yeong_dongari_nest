import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yeong_dongari_nest/common/util/firebase_utils.dart';
import 'package:yeong_dongari_nest/feature/authentication/repo/auth_repo.dart';
import 'package:yeong_dongari_nest/feature/authentication/view_model/user_vm.dart';
import 'package:yeong_dongari_nest/feature/home/view/home_screen.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _authRepository = ref.read(authRepo);
  }

  Future<void> emailSignUp(
    BuildContext context,
    Map<String, String> formData,
  ) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final name = formData['name']!;
      final email = formData['email']!;
      final password = formData['password']!;

      final credential = await _authRepository.emailSignUp(email, password);
      await ref.read(userProvider.notifier).createUser(credential, name: name);
    });

    if (!context.mounted) return;
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.go(HomeScreen.routeUrl);
    }
  }
}

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
