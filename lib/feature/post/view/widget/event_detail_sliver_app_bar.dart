import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeong_dongari_nest/constants/colors.dart';
import 'package:yeong_dongari_nest/constants/gaps.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';
import 'package:yeong_dongari_nest/constants/text.dart';
import 'package:yeong_dongari_nest/feature/post/model/event_model.dart';

class EventDetailSliverAppBar extends ConsumerWidget {
  final EventModel event;
  final VoidCallback? onMenuTap;

  const EventDetailSliverAppBar({
    super.key,
    required this.event,
    this.onMenuTap,
  });

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}일 전';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}시간 전';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}분 전';
    } else {
      return '방금 전';
    }
  }

  double _calculateExpandedHeight(BuildContext context) {
    const baseHeight = 140.0;

    final textPainter = TextPainter(
      text: TextSpan(
        text: event.title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20),
      ),
      maxLines: 5,
      textDirection: TextDirection.ltr,
    );

    final maxWidth = MediaQuery.of(context).size.width - (Sizes.d16 * 2);
    textPainter.layout(maxWidth: maxWidth);

    final titleHeight = textPainter.height;

    final noticeHeight = event.isNotice ? 28.0 : 0.0;

    final totalHeight = baseHeight + titleHeight + noticeHeight;
    return totalHeight.clamp(140.0, 400.0);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      expandedHeight: _calculateExpandedHeight(context),
      pinned: true,
      elevation: 0.5,
      actionsPadding: EdgeInsets.only(right: Sizes.d16),
      actions: [
        IconButton(
          onPressed: onMenuTap,
          icon: FaIcon(FontAwesomeIcons.ellipsis),
          iconSize: Sizes.d20,
        ),
      ],
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final expandedHeight = _calculateExpandedHeight(context);
          final expandRatio =
              (constraints.maxHeight - kToolbarHeight) /
              (expandedHeight - kToolbarHeight);
          final isExpanded = expandRatio > 0.7;

          return FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(
              left: Sizes.d56,
              right: Sizes.d56,
              bottom: Sizes.d18,
            ),
            title: !isExpanded ? TtitleMedium18(event.title) : null,
            centerTitle: false,
            background: Padding(
              padding: EdgeInsets.only(
                left: Sizes.d16,
                right: Sizes.d16,
                bottom: Sizes.d8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (event.isNotice) ...[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.d8,
                        vertical: Sizes.d4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(Sizes.d4),
                      ),
                      child: TlabelSmall12("공지", color: Colors.white),
                    ),
                    Gaps.v8,
                  ],
                  TtitleMedium18(event.title, maxLines: 5),
                  Gaps.v12,
                  Row(
                    children: [
                      CircleAvatar(
                        radius: Sizes.d16,
                        backgroundColor: AppColors.neutral300LD(context, ref),
                        child: TlabelSmall12(
                          event.name[0],
                          color: AppColors.neutral600LD(context, ref),
                        ),
                      ),
                      Gaps.h8,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TbodyMedium16(event.name),
                          Gaps.v2,
                          TlabelSmall12(
                            _formatTime(event.createdAt),
                            color: AppColors.neutral500,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gaps.v12,
                  Divider(color: AppColors.neutral200LD(context, ref)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
