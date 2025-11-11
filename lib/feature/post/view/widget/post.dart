import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeong_dongari_nest/constants/colors.dart';
import 'package:yeong_dongari_nest/constants/gaps.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';
import 'package:yeong_dongari_nest/constants/text.dart';
import 'package:yeong_dongari_nest/feature/post/model/post_model.dart';

class Post extends ConsumerWidget {
  final PostModel post;

  const Post({super.key, required this.post});

  void _onPostTap() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: _onPostTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.d12,
          horizontal: Sizes.d16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: TtitleSmall16(post.title)),
                Gaps.h8,
              ],
            ),
            Gaps.v8,
            Row(
              children: [
                TlabelSmall12(post.name),
                Gaps.h4,
                TlabelSmall12("•", color: AppColors.neutral400LD(context, ref)),
                Gaps.h4,
                TlabelSmall12(
                  "${post.createdAt.hour.toString().padLeft(2, '0')}:${post.createdAt.minute.toString().padLeft(2, '0')}",
                ),
              ],
            ),
            Gaps.v8,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (post.content != null && post.content!.isNotEmpty) ...[
                        TbodySmall14(post.content!, maxLines: 3),
                        Gaps.v8,
                      ],
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.heart,
                                size: Sizes.d12,
                                color: AppColors.neutral500,
                              ),
                              Gaps.h4,
                              TlabelSmall12(post.likes.toString()),
                              Gaps.h12,
                              FaIcon(
                                FontAwesomeIcons.comment,
                                size: Sizes.d12,
                                color: AppColors.neutral500,
                              ),
                              Gaps.h4,
                              TlabelSmall12(post.comments.toString()),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (post.thumbUrl != null) ...[
                  Gaps.h12,
                  Container(
                    width: Sizes.d80,
                    height: Sizes.d80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.d8),
                      color: AppColors.neutral200LD(context, ref),
                      image: DecorationImage(
                        image: NetworkImage(post.thumbUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
