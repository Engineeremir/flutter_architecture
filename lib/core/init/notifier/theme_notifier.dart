import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_architecture/core/constants/enums/app_theme_enums.dart';
import 'package:flutter_architecture/core/init/theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }
}
