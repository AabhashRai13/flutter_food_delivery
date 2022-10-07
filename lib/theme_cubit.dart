import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerz_store/Themes/style.dart';
import 'package:hungerz_store/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeData> {
  bool _isDark = false;

  ThemeCubit() : super(appTheme);

  bool get isDark => _isDark;

  getCurrentTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String currTheme = sharedPreferences.containsKey("currentThemeKey")
        ? sharedPreferences.getString("currentThemeKey")!
        : Constants.themeLight;
    setTheme(currTheme == Constants.themeDark);
  }

  setTheme(bool isDark) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        "currentThemeKey", isDark ? Constants.themeDark : Constants.themeLight);
    _isDark = isDark;
    emit(isDark ? darkTheme : appTheme);
  }
}
