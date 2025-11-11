import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeong_dongari_nest/constants/colors.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';
import 'package:yeong_dongari_nest/feature/setting/view_model/setting_vm.dart';
import 'package:yeong_dongari_nest/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Yeong Dongari Nest',
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(routerProvider),
      themeMode: ref.watch(settingProvider.notifier).themeMode,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.neutral100,
          error: AppColors.error,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: AppColors.neutral800,
          onError: Colors.white,
        ),
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.neutral800,
          elevation: 0,
        ),
        bottomAppBarTheme: BottomAppBarThemeData(color: AppColors.neutral100),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(color: AppColors.neutral400),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        tabBarTheme: TabBarThemeData(
          labelStyle: Theme.of(context).textTheme.titleSmall,
          unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
          unselectedLabelColor: AppColors.neutral500,
          labelColor: Colors.white,
          indicatorColor: Colors.transparent,
        ),
        dividerTheme: DividerThemeData(color: AppColors.neutral200),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: "PretendardSemibold",
            fontSize: Sizes.d20,
            letterSpacing: -0.025,
            color: AppColors.neutral800,
          ),
          titleMedium: TextStyle(
            fontFamily: "PretendardSemibold",
            fontSize: Sizes.d18,
            letterSpacing: -0.025,
            color: AppColors.neutral800,
          ),
          titleSmall: TextStyle(
            fontFamily: "PretendardSemibold",
            fontSize: Sizes.d16,
            letterSpacing: -0.025,
            color: AppColors.neutral800,
          ),
          bodyLarge: TextStyle(
            fontFamily: "PretendardMedium",
            fontSize: Sizes.d18,
            letterSpacing: -0.025,
            color: AppColors.neutral800,
          ),
          bodyMedium: TextStyle(
            fontFamily: "PretendardMedium",
            fontSize: Sizes.d16,
            letterSpacing: -0.025,
            color: AppColors.neutral800,
          ),
          bodySmall: TextStyle(
            fontFamily: "PretendardMedium",
            fontSize: Sizes.d14,
            letterSpacing: -0.025,
            color: AppColors.neutral800,
          ),
          labelLarge: TextStyle(
            fontFamily: "PretendardSemibold",
            fontSize: Sizes.d14,
            letterSpacing: -0.025,
            color: AppColors.neutral800,
          ),
          labelSmall: TextStyle(
            fontFamily: "PretendardMedium",
            fontSize: Sizes.d12,
            letterSpacing: -0.025,
            color: AppColors.neutral800,
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: false,
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.neutral900,
          error: AppColors.error,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: AppColors.neutral200,
          onError: Colors.white,
        ),
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: AppColors.neutral200,
          elevation: 0,
        ),
        bottomAppBarTheme: BottomAppBarThemeData(color: AppColors.neutral800),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(color: AppColors.neutral500),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        tabBarTheme: TabBarThemeData(
          labelStyle: Theme.of(context).textTheme.titleSmall,
          unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
          unselectedLabelColor: AppColors.neutral500,
          labelColor: Colors.white,
          indicatorColor: Colors.transparent,
        ),
        dividerTheme: DividerThemeData(color: AppColors.neutral800),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: "PretendardSemibold",
            fontSize: Sizes.d20,
            letterSpacing: -0.025,
            color: AppColors.neutral200,
          ),
          titleMedium: TextStyle(
            fontFamily: "PretendardSemibold",
            fontSize: Sizes.d18,
            letterSpacing: -0.025,
            color: AppColors.neutral200,
          ),
          titleSmall: TextStyle(
            fontFamily: "PretendardSemibold",
            fontSize: Sizes.d16,
            letterSpacing: -0.025,
            color: AppColors.neutral200,
          ),
          bodyLarge: TextStyle(
            fontFamily: "PretendardMedium",
            fontSize: Sizes.d18,
            letterSpacing: -0.025,
            color: AppColors.neutral200,
          ),
          bodyMedium: TextStyle(
            fontFamily: "PretendardMedium",
            fontSize: Sizes.d16,
            letterSpacing: -0.025,
            color: AppColors.neutral200,
          ),
          bodySmall: TextStyle(
            fontFamily: "PretendardMedium",
            fontSize: Sizes.d14,
            letterSpacing: -0.025,
            color: AppColors.neutral200,
          ),
          labelLarge: TextStyle(
            fontFamily: "PretendardSemibold",
            fontSize: Sizes.d14,
            letterSpacing: -0.025,
            color: AppColors.neutral200,
          ),
          labelSmall: TextStyle(
            fontFamily: "PretendardMedium",
            fontSize: Sizes.d12,
            letterSpacing: -0.025,
            color: AppColors.neutral200,
          ),
        ),
      ),
    );
  }
}
