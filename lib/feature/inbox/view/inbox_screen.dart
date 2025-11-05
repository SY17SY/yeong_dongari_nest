import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/constants/text.dart';

class InboxScreen extends ConsumerStatefulWidget {
  static const String routeName = "inbox";
  static const String routeUrl = "/inbox";
  const InboxScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InboxScreenState();
}

class _InboxScreenState extends ConsumerState<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: TtitleLarge20("inbox")));
  }
}
