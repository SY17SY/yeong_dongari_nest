import 'package:flutter/material.dart';
import 'package:canary_oklch/canary_oklch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/feature/setting/view_model/setting_vm.dart';

class AppColors {
  // Primary colors using OKLCH
  static final primary = OklchColor(0.6, 0.1234, 151.09).toColor();
  static final primaryLight = OklchColor(0.7, 0.1234, 151.09).toColor();
  static final primaryLightest = OklchColor(0.8, 0.1234, 151.09).toColor();
  static final primaryDark = OklchColor(0.5, 0.1234, 151.09).toColor();
  static final primaryDarkest = OklchColor(0.4, 0.1234, 151.09).toColor();

  // Auto-reversing primary colors (light mode ↔ dark mode)
  static Color primaryLightLD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? primaryDark : primaryLight;
  }

  static Color primaryLightestLD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? primaryDarkest : primaryLightest;
  }

  static Color primaryDarkLD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? primaryLight : primaryDark;
  }

  static Color primaryDarkestLD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? primaryLightest : primaryDarkest;
  }

  // Secondary colors
  static final secondary = OklchColor(0.6, 0.1234, 232.24).toColor();
  static final secondaryLight = OklchColor(0.7, 0.1234, 232.24).toColor();
  static final secondaryLightest = OklchColor(0.8, 0.1234, 232.24).toColor();
  static final secondaryDark = OklchColor(0.5, 0.1234, 232.24).toColor();
  static final secondaryDarkest = OklchColor(0.4, 0.1234, 232.24).toColor();

  // Auto-reversing secondary colors (light mode ↔ dark mode)
  static Color secondaryLightLD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? secondaryDark : secondaryLight;
  }

  static Color secondaryLightestLD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? secondaryDarkest : secondaryLightest;
  }

  static Color secondaryDarkLD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? secondaryLight : secondaryDark;
  }

  static Color secondaryDarkestLD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? secondaryLightest : secondaryDarkest;
  }

  // Neutral colors
  static final neutral100 = OklchColor(0.95, 0.008, 267).toColor();
  static final neutral200 = OklchColor(0.9, 0.008, 267).toColor();
  static final neutral300 = OklchColor(0.8, 0.008, 267).toColor();
  static final neutral400 = OklchColor(0.7, 0.008, 267).toColor();
  static final neutral500 = OklchColor(0.6, 0.008, 267).toColor();
  static final neutral600 = OklchColor(0.5, 0.008, 267).toColor();
  static final neutral700 = OklchColor(0.4, 0.008, 267).toColor();
  static final neutral800 = OklchColor(0.3, 0.008, 267).toColor();
  static final neutral900 = OklchColor(0.1, 0.008, 267).toColor();

  // Auto-reversing neutral colors (light mode ↔ dark mode)
  static Color neutral100LD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? neutral900 : neutral100;
  }

  static Color neutral200LD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? neutral800 : neutral200;
  }

  static Color neutral300LD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? neutral700 : neutral300;
  }

  static Color neutral400LD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? neutral600 : neutral400;
  }

  static Color neutral500LD(BuildContext context, WidgetRef ref) {
    // neutral500 stays the same in both modes
    return neutral500;
  }

  static Color neutral600LD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? neutral400 : neutral600;
  }

  static Color neutral700LD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? neutral300 : neutral700;
  }

  static Color neutral800LD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? neutral200 : neutral800;
  }

  static Color neutral900LD(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(settingProvider.notifier).isDark(context);
    return isDark ? neutral100 : neutral900;
  }

  // Success, Warning, Error colors
  static final success = OklchColor(0.7, 0.18, 140).toColor();
  static final warning = OklchColor(0.8, 0.18, 80).toColor();
  static final error = OklchColor(0.7, 0.18, 35).toColor();

  // Helper method to create color variations
  static Color createVariation({
    required Color baseColor,
    double lightnessOffset = 0.0,
    double chromaOffset = 0.0,
    double hueOffset = 0.0,
  }) {
    final oklch = OklchColor.fromColor(baseColor);
    return OklchColor(
      (oklch.l + lightnessOffset).clamp(0.0, 1.0),
      (oklch.c + chromaOffset).clamp(0.0, 0.4),
      (oklch.h + hueOffset) % 360,
    ).toColor();
  }
}
