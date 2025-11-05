import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/constants/text.dart';

class UploadScreen extends ConsumerStatefulWidget {
  static const String routeName = "upload";
  static const String routeUrl = "/upload";
  const UploadScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UploadScreenState();
}

class _UploadScreenState extends ConsumerState<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: TtitleLarge20("upload")));
  }
}
