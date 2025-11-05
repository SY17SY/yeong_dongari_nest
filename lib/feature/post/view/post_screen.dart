import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/constants/text.dart';

class PostScreen extends ConsumerStatefulWidget {
  static const String routeName = "post";
  static const String routeUrl = "/post";
  const PostScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: TtitleLarge20("post")));
  }
}
