import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/constants/colors.dart';
import 'package:yeong_dongari_nest/constants/gaps.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';
import 'package:yeong_dongari_nest/constants/text.dart';
import 'package:yeong_dongari_nest/feature/feed/view/widget/event.dart';
import 'package:yeong_dongari_nest/feature/feed/view/widget/post.dart';
import 'package:yeong_dongari_nest/feature/feed/view/widget/feed_sliver_app_bar.dart';
import 'package:yeong_dongari_nest/feature/feed/view_model/events_vm.dart';
import 'package:yeong_dongari_nest/feature/feed/view_model/posts_vm.dart';

class FeedScreen extends ConsumerStatefulWidget {
  static const String routeName = "feed";
  static const String routeUrl = "/feed";
  const FeedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        FeedSliverAppBar(),
        ref
            .watch(eventsProvider)
            .when(
              data: (events) {
                if (events.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(Sizes.d40),
                        child: TbodyMedium16(
                          "행사가 없습니다.",
                          color: AppColors.neutral400,
                        ),
                      ),
                    ),
                  );
                }
                return SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        child: PageView.builder(
                          controller: PageController(viewportFraction: 0.9),
                          itemCount: events.length,
                          itemBuilder: (context, index) =>
                              Event(event: events[index]),
                        ),
                      ),
                      Gaps.v20,
                    ],
                  ),
                );
              },
              loading: () => SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator.adaptive()),
              ),
              error: (error, stackTrace) => SliverToBoxAdapter(
                child: Center(child: Text("error: ${error.toString()}")),
              ),
            ),
        ref
            .watch(postsProvider)
            .when(
              data: (posts) {
                if (posts.isEmpty) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(Sizes.d40),
                        child: TbodyMedium16(
                          "글이 없습니다.",
                          color: AppColors.neutral400,
                        ),
                      ),
                    ),
                  );
                }
                return SliverList.separated(
                  itemCount: posts.length,
                  itemBuilder: (context, index) => Post(post: posts[index]),
                  separatorBuilder: (context, index) =>
                      Divider(color: AppColors.neutral400LD(context, ref)),
                );
              },
              loading: () => SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator.adaptive()),
              ),
              error: (error, stackTrace) => SliverToBoxAdapter(
                child: Center(child: Text("error: ${error.toString()}")),
              ),
            ),
      ],
    );
  }
}
