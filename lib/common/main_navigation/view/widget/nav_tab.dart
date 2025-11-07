import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeong_dongari_nest/constants/gaps.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';
import 'package:yeong_dongari_nest/constants/text.dart';

class NavTab extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final int selectedIndex;
  const NavTab({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: AnimatedOpacity(
          opacity: isSelected ? 1 : 0.6,
          duration: Duration(milliseconds: 200),
          child: Padding(
            padding: const EdgeInsets.only(top: Sizes.d10, bottom: Sizes.d16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(isSelected ? selectedIcon : icon, size: Sizes.d20),
                Gaps.v6,
                TlabelSmall12(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
