import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';
import 'package:yeong_dongari_nest/constants/text.dart';

class PostSliverAppBar extends StatelessWidget {
  const PostSliverAppBar({super.key});

  void _onSearchTap() {}

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0.5,
      floating: true,
      title: TbodyLarge18("동아리명"),
      centerTitle: false,
      actionsPadding: EdgeInsets.only(right: Sizes.d16),
      actions: [
        IconButton(
          onPressed: _onSearchTap,
          icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
          iconSize: Sizes.d20,
        ),
      ],
    );
  }
}
