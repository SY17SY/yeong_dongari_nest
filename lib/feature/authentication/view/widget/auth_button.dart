import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeong_dongari_nest/constants/colors.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';
import 'package:yeong_dongari_nest/constants/text.dart';

class AuthButton extends ConsumerWidget {
  final IconData icon;
  final String text;

  const AuthButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: EdgeInsets.all(Sizes.d24),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.neutral300LD(context, ref),
            width: Sizes.d1,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: FaIcon(icon, size: Sizes.d16),
            ),
            TtitleSmall16(text, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
