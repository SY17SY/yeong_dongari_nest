import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  // return GoRouter(
  //   initialLocation: HomeScreen.routeUrl,
  //   routes: [
  //     GoRoute(
  //       name: MainNavigationScreen.routeName,
  //       path: "/:tab(home|post|notification|profile)",
  //       builder: (context, state) {
  //         final tab = state.pathParameters["tab"]!;
  //         return MainNavigationScreen(tab: tab);
  //       },
  //     ),
  //     GoRoute(
  //       name: UploadScreen.routeName,
  //       path: UploadScreen.routeUrl,
  //       builder: (context, state) => const UploadScreen(),
  //     ),
  //   ],
  // );
});
