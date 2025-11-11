import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yeong_dongari_nest/constants/colors.dart';
import 'package:yeong_dongari_nest/constants/gaps.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';
import 'package:yeong_dongari_nest/constants/text.dart';
import 'package:yeong_dongari_nest/feature/feed/model/event_model.dart';
import 'package:yeong_dongari_nest/feature/feed/view/event_detail_screen.dart';

class Event extends ConsumerWidget {
  final EventModel event;

  const Event({super.key, required this.event});

  void _onEventTap(BuildContext context) {
    context.pushNamed(
      EventDetailScreen.routeName,
      pathParameters: {"tab": "feed", "eventId": event.id},
      extra: event,
    );
  }

  String _formatDate(DateTimeRange dateRange) {
    final start = dateRange.start;
    final end = dateRange.end;

    final isSameDay =
        start.year == end.year &&
        start.month == end.month &&
        start.day == end.day;

    if (isSameDay) {
      return "${start.month}/${start.day}";
    } else {
      return "${start.month}/${start.day} - ${end.month}/${end.day}";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _onEventTap(context),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Sizes.d8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.d16),
          color: AppColors.neutral200LD(context, ref),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.d16),
          child: Stack(
            children: [
              if (event.thumbUrl != null)
                Positioned.fill(
                  child: Image.network(event.thumbUrl!, fit: BoxFit.cover),
                ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: Sizes.d16,
                right: Sizes.d16,
                bottom: Sizes.d16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TtitleSmall16(
                      event.title,
                      color: AppColors.neutral100,
                      maxLines: 2,
                    ),
                    if (event.content != null && event.content!.isNotEmpty) ...[
                      Gaps.v8,
                      TbodySmall14(
                        event.content!,
                        color: AppColors.neutral100,
                        maxLines: 3,
                      ),
                    ],
                    Gaps.v12,
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: Sizes.d16,
                          color: AppColors.neutral200,
                        ),
                        Gaps.h4,
                        TbodySmall14(
                          _formatDate(event.date),
                          color: AppColors.neutral200,
                        ),
                        if (event.place != null && event.place!.isNotEmpty) ...[
                          Gaps.h12,
                          Icon(
                            Icons.place,
                            size: Sizes.d16,
                            color: AppColors.neutral200,
                          ),
                          Gaps.h4,
                          Expanded(
                            child: TbodySmall14(
                              event.place!,
                              color: AppColors.neutral200,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
