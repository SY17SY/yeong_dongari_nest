import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/feature/post/model/post_model.dart';

class PostRepository {
  Stream<List<PostModel>> getPosts() {
    Stream<List<PostModel>> posts = Stream.value([]);
    return posts;
  }

  Future<void> deletePost(String postId) async {}
}

final postRepository = Provider((ref) => PostRepository());
