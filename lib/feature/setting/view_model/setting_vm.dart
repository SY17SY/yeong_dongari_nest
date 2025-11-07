import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yeong_dongari_nest/feature/setting/model/setting_model.dart';
import 'package:yeong_dongari_nest/feature/setting/repo/setting_repo.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

class SettingViewModel extends Notifier<SettingModel> {
  late final SettingRepository _settingRepository;

  @override
  SettingModel build() {
    final preferences = ref.watch(sharedPreferencesProvider);
    _settingRepository = SettingRepository(preferences);
    return SettingModel(
      darkMode: _settingRepository.isDarkMode(),
      followSystem: _settingRepository.isFollowSystem(),
    );
  }

  void setThemeMode({required bool followSystem, required bool darkMode}) {
    _settingRepository.setFollowSystem(followSystem);
    _settingRepository.setDarkMode(darkMode);
    state = SettingModel(darkMode: darkMode, followSystem: followSystem);
  }

  ThemeMode get themeMode {
    if (state.followSystem) {
      return ThemeMode.system;
    }
    return state.darkMode ? ThemeMode.dark : ThemeMode.light;
  }

  bool isDark(BuildContext context) {
    if (state.followSystem) {
      return Theme.of(context).brightness == Brightness.dark;
    }
    return state.darkMode;
  }
}

final settingProvider = NotifierProvider<SettingViewModel, SettingModel>(
  () => SettingViewModel(),
);
