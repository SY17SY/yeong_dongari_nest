import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeong_dongari_nest/constants/colors.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';

class InputClearButton extends ConsumerWidget {
  final TextEditingController controller;

  const InputClearButton({super.key, required this.controller});

  void _onClearTap(TextEditingController controller) {
    controller.clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _onClearTap(controller),
      child: FaIcon(
        FontAwesomeIcons.solidCircleXmark,
        color: AppColors.neutral400LD(context, ref),
        size: Sizes.d20,
      ),
    );
  }
}
