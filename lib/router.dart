import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yeong_dongari_nest/common/main_navigation/view/main_navigation_shell.dart';
import 'package:yeong_dongari_nest/feature/home/view/home_screen.dart';
import 'package:yeong_dongari_nest/feature/post/model/post_model.dart';
import 'package:yeong_dongari_nest/feature/post/view/post_detail_screen.dart';
import 'package:yeong_dongari_nest/feature/upload/view/upload_screen.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: HomeScreen.routeUrl,
    routes: [
      GoRoute(
        name: MainNavigationShell.routeName,
        path: "/:tab(home|post|inbox|profile)",
        builder: (context, state) {
          final tab = state.pathParameters["tab"]!;
          return MainNavigationShell(tab: tab);
        },
        routes: [
          GoRoute(
            name: PostDetailScreen.routeName,
            path: PostDetailScreen.routeUrl,
            builder: (context, state) {
              final postId = state.pathParameters["postId"]!;
              final post = state.extra as PostModel;
              return PostDetailScreen(postId: postId, post: post);
            },
          ),
        ],
      ),
      GoRoute(
        name: UploadScreen.routeName,
        path: UploadScreen.routeUrl,
        pageBuilder: (context, state) =>
            MaterialPage(fullscreenDialog: true, child: UploadScreen()),
      ),
    ],
  );
});
