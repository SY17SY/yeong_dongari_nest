import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yeong_dongari_nest/common/main_navigation/model/navigation_model.dart';

class MainNavigationViewModel extends Notifier<NavigationState> {
  NavigationTab _initialTab = NavigationTab.home;

  @override
  NavigationState build() {
    return NavigationState(
      selectedTab: _initialTab,
      selectedIndex: _initialTab.index,
    );
  }

  void initialize(String tab) {
    final initialTab = NavigationState.fromString(tab);
    _initialTab = initialTab;
  }

  void selectTab(NavigationTab tab) {
    state = state.copyWith(selectedTab: tab, selectedIndex: tab.index);
  }

  void selectTabByIndex(int index) {
    final tab = NavigationTab.values[index];
    selectTab(tab);
  }

  void updateFromRoute(String tab) {
    final navigationTab = NavigationState.fromString(tab);
    if (state.selectedTab != navigationTab) {
      selectTab(navigationTab);
    }
  }

  bool get isHomeSelected => state.selectedIndex == 0;
  int get selectedIndex => state.selectedIndex;
  NavigationTab get selectedTab => state.selectedTab;
}

final mainNavigationProvider =
    NotifierProvider<MainNavigationViewModel, NavigationState>(
      () => MainNavigationViewModel(),
    );
