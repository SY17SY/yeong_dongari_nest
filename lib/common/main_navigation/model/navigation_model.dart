enum NavigationTab {
  home(0, "home"),
  post(1, "post"),
  upload(2, "upload"),
  inbox(3, "inbox"),
  profile(4, "profile");

  const NavigationTab(int index, String name);
}

class NavigationState {
  final NavigationTab selectedTab;
  final int selectedIndex;

  const NavigationState({
    required this.selectedTab,
    required this.selectedIndex,
  });

  NavigationState copyWith({NavigationTab? selectedTab, int? selectedIndex}) {
    return NavigationState(
      selectedTab: selectedTab ?? this.selectedTab,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  static NavigationTab fromString(String tab) {
    switch (tab) {
      case "home":
        return NavigationTab.home;
      case "post":
        return NavigationTab.post;
      case "upload":
        return NavigationTab.upload;
      case "inbox":
        return NavigationTab.inbox;
      case "profile":
        return NavigationTab.profile;
      default:
        return NavigationTab.home;
    }
  }
}
