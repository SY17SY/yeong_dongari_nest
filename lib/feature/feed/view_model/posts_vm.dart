import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/feature/feed/model/post_model.dart';
import 'package:yeong_dongari_nest/feature/feed/repo/post_repo.dart';

class PostsViewModel extends StreamNotifier<List<PostModel>> {
  late final PostRepository _postRepository;

  @override
  Stream<List<PostModel>> build() {
    _postRepository = ref.read(postRepository);
    return _postRepository.getPosts();
  }
}

final postsProvider = StreamNotifierProvider<PostsViewModel, List<PostModel>>(
  () => PostsViewModel(),
);
