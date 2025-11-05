import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/constants/text.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  static const String routeName = "profile";
  static const String routeUrl = "/profile";
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: TtitleLarge20("profile")));
  }
}
