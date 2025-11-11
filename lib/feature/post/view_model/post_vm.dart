import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/feature/post/model/post_model.dart';
import 'package:yeong_dongari_nest/feature/post/repo/post_repo.dart';

class PostViewModel extends StreamNotifier<List<PostModel>> {
  late final PostRepository _postRepository;

  @override
  Stream<List<PostModel>> build() {
    _postRepository = ref.read(postRepository);
    return _postRepository.getPosts();
  }

  Future<void> deletePost(String postId) async {
    await _postRepository.deletePost(postId);
  }
}

final postProvider = StreamNotifierProvider<PostViewModel, List<PostModel>>(
  () => PostViewModel(),
);
