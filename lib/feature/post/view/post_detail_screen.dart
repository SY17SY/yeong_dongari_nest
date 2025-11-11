import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yeong_dongari_nest/constants/colors.dart';
import 'package:yeong_dongari_nest/constants/gaps.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';
import 'package:yeong_dongari_nest/constants/text.dart';
import 'package:yeong_dongari_nest/feature/post/model/post_model.dart';
import 'package:yeong_dongari_nest/feature/post/view/widget/post_detail_sliver_app_bar.dart';

class PostDetailScreen extends ConsumerStatefulWidget {
  static const String routeName = "postDetail";
  static const String routeUrl = "post/:postId";

  final String postId;
  final PostModel post;

  const PostDetailScreen({super.key, required this.postId, required this.post});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PostDetailScreenState();
}

class _PostDetailScreenState extends ConsumerState<PostDetailScreen> {
  bool _isLiked = false;

  void _onLikeTap() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  void _onCommentTap() {
    // TODO: Show comments
  }

  void _onShareTap() {
    // TODO: Share post
  }

  void _onMenuTap() {
    // TODO: Show menu (edit, delete, report)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          PostDetailSliverAppBar(post: widget.post, onMenuTap: _onMenuTap),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Content
                if (widget.post.content != null &&
                    widget.post.content!.isNotEmpty) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.d16),
                    child: TbodyMedium16(
                      widget.post.content!,
                      color: AppColors.neutral700LD(context, ref),
                      maxLines: 100,
                    ),
                  ),
                  Gaps.v16,
                ],

                // Images
                if (widget.post.imgUrls != null &&
                    widget.post.imgUrls!.isNotEmpty) ...[
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      itemCount: widget.post.imgUrls!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: Sizes.d16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Sizes.d12),
                            color: AppColors.neutral200LD(context, ref),
                            image: DecorationImage(
                              image: NetworkImage(widget.post.imgUrls![index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Gaps.v16,
                ] else if (widget.post.thumbUrl != null) ...[
                  // Single thumbnail image
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: Sizes.d16),
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.d12),
                      color: AppColors.neutral200LD(context, ref),
                      image: DecorationImage(
                        image: NetworkImage(widget.post.thumbUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Gaps.v16,
                ],

                // Stats and Actions
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.d16),
                  child: Column(
                    children: [
                      Divider(),
                      Gaps.v8,
                      Row(
                        children: [
                          TlabelLarge14(
                            '좋아요 ${widget.post.likes + (_isLiked ? 1 : 0)}개',
                          ),
                          Gaps.h16,
                          TlabelLarge14('댓글 ${widget.post.comments}개'),
                        ],
                      ),
                      Gaps.v8,
                      Divider(),
                      Gaps.v4,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _ActionButton(
                            icon: _isLiked
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            label: '좋아요',
                            onTap: _onLikeTap,
                            isActive: _isLiked,
                          ),
                          _ActionButton(
                            icon: FontAwesomeIcons.comment,
                            label: '댓글',
                            onTap: _onCommentTap,
                          ),
                          _ActionButton(
                            icon: FontAwesomeIcons.shareNodes,
                            label: '공유',
                            onTap: _onShareTap,
                          ),
                        ],
                      ),
                      Gaps.v4,
                      Divider(),
                    ],
                  ),
                ),

                // Comments section placeholder
                Padding(
                  padding: EdgeInsets.all(Sizes.d16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TtitleMedium18('댓글 ${widget.post.comments}'),
                      Gaps.v16,
                      Center(
                        child: TbodyMedium16(
                          '아직 댓글이 없습니다.',
                          color: AppColors.neutral400LD(context, ref),
                        ),
                      ),
                      Gaps.v40,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.d16,
          vertical: Sizes.d8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              icon,
              size: Sizes.d18,
              color: isActive ? AppColors.primary : AppColors.neutral500,
            ),
            Gaps.h8,
            TlabelLarge14(
              label,
              color: isActive ? AppColors.primary : AppColors.neutral500,
            ),
          ],
        ),
      ),
    );
  }
}
