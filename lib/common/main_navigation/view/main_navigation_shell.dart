import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:yeong_dongari_nest/common/main_navigation/model/navigation_model.dart';
import 'package:yeong_dongari_nest/common/main_navigation/view_model/main_navigation_vm.dart';
import 'package:yeong_dongari_nest/common/main_navigation/view/widget/nav_tab.dart';
import 'package:yeong_dongari_nest/feature/home/view/home_screen.dart';
import 'package:yeong_dongari_nest/feature/inbox/view/inbox_screen.dart';
import 'package:yeong_dongari_nest/feature/post/view/post_screen.dart';
import 'package:yeong_dongari_nest/feature/profile/view/profile_screen.dart';
import 'package:yeong_dongari_nest/feature/upload/view/upload_screen.dart';

class MainNavigationShell extends ConsumerStatefulWidget {
  static const String routeName = "mainNavigation";
  final String tab;

  const MainNavigationShell({super.key, required this.tab});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainNavigationShellState();
}

class _MainNavigationShellState extends ConsumerState<MainNavigationShell> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mainNavigationProvider.notifier).initialize(widget.tab);
      ref.read(mainNavigationProvider.notifier).updateFromRoute(widget.tab);
    });
  }

  @override
  void didUpdateWidget(covariant MainNavigationShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tab != widget.tab) {
      ref.read(mainNavigationProvider.notifier).updateFromRoute(widget.tab);
    }
  }

  void _onTap(int index) {
    final viewModel = ref.read(mainNavigationProvider.notifier);
    final tab = NavigationTab.values[index];
    final name = tab.name;

    context.go("/$name");
    viewModel.selectTab(tab);
  }

  void _onUploadButtonTap() {
    context.push(UploadScreen.routeUrl);
  }

  @override
  Widget build(BuildContext context) {
    final navigationState = ref.watch(mainNavigationProvider);
    final selectedIndex = navigationState.selectedIndex;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(offstage: selectedIndex != 0, child: HomeScreen()),
          Offstage(offstage: selectedIndex != 1, child: PostScreen()),
          Offstage(offstage: selectedIndex != 3, child: InboxScreen()),
          Offstage(offstage: selectedIndex != 4, child: ProfileScreen()),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            NavTab(
              icon: FontAwesomeIcons.house,
              selectedIcon: FontAwesomeIcons.house,
              text: "Home",
              isSelected: selectedIndex == 0,
              onTap: () => _onTap(0),
              selectedIndex: selectedIndex,
            ),
            NavTab(
              icon: FontAwesomeIcons.compass,
              selectedIcon: FontAwesomeIcons.solidCompass,
              text: "Post",
              isSelected: selectedIndex == 1,
              onTap: () => _onTap(1),
              selectedIndex: selectedIndex,
            ),
            NavTab(
              icon: FontAwesomeIcons.plus,
              selectedIcon: FontAwesomeIcons.plus,
              text: "Upload",
              isSelected: selectedIndex == 2,
              onTap: () => _onUploadButtonTap(),
              selectedIndex: selectedIndex,
            ),
            NavTab(
              icon: FontAwesomeIcons.message,
              selectedIcon: FontAwesomeIcons.solidMessage,
              text: "Inbox",
              isSelected: selectedIndex == 3,
              onTap: () => _onTap(3),
              selectedIndex: selectedIndex,
            ),
            NavTab(
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              text: "Profile",
              isSelected: selectedIndex == 4,
              onTap: () => _onTap(4),
              selectedIndex: selectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}
