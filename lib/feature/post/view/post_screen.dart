import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/constants/colors.dart';
import 'package:yeong_dongari_nest/constants/sizes.dart';
import 'package:yeong_dongari_nest/constants/text.dart';
import 'package:yeong_dongari_nest/feature/post/view/widget/post.dart';
import 'package:yeong_dongari_nest/feature/post/view/widget/post_sliver_app_bar.dart';
import 'package:yeong_dongari_nest/feature/post/view_model/post_vm.dart';

class PostScreen extends ConsumerStatefulWidget {
  static const String routeName = "post";
  static const String routeUrl = "/post";
  const PostScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
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
        PostSliverAppBar(),
        ref
            .watch(postProvider)
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
