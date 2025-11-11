class PostModel {
  String id;
  final String uid;
  final String name;
  final String title;
  final String? content;
  final String? thumbUrl;
  final List<String>? imgUrls;
  final int likes;
  final int comments;
  final bool isNotice;
  final DateTime createdAt;

  PostModel({
    this.id = "",
    required this.uid,
    required this.name,
    required this.title,
    this.content,
    this.thumbUrl,
    this.imgUrls,
    this.likes = 0,
    this.comments = 0,
    required this.isNotice,
    required this.createdAt,
  });

  PostModel.fromJson(Map<String, dynamic> json, {required String postId})
    : id = postId,
      uid = json["uid"],
      name = json["name"],
      title = json["title"],
      content = json["content"],
      thumbUrl = json["thumbUrl"] as String?,
      imgUrls = json["imgUrls"] != null
          ? List<String>.from(json["imgUrls"])
          : null,
      likes = json["likes"],
      comments = json["comments"],
      isNotice = json["isNotice"],
      createdAt = json["createdAt"];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'title': title,
      'content': content,
      'thumbUrl': thumbUrl,
      'imgUrls': imgUrls,
      'likes': likes,
      'comments': comments,
      'isNotice': isNotice,
      'createdAt': createdAt,
    };
  }
}
