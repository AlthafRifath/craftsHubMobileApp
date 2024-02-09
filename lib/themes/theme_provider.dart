import 'package:flutter/material.dart';
import 'package:craftshubapp/themes/dark_mode.dart';
import 'package:craftshubapp/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  toggleTheme() {
    if (_themeData == lightmode) {
      _themeData = darkmode;
    } else {
      _themeData = lightmode;
    }
    notifyListeners();
  }
}
