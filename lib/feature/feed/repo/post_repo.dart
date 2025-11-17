import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/feature/feed/model/post_model.dart';

class PostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<PostModel>> getPosts() {
    final query = _db
        .collection("posts")
        .orderBy("createdAt", descending: true)
        .snapshots();
    return query.map(
      (event) => event.docs
          .map((doc) => PostModel.fromJson(doc.data(), postId: doc.id))
          .toList(),
    );
  }

  Future<void> deletePost(String postId) async {}
}

final postRepository = Provider((ref) => PostRepository());
