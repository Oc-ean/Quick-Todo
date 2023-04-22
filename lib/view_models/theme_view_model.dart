import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemes {
  LIGHT,
  DARK,
}

class ThemeViewModel extends ChangeNotifier {
  // bool _isDark = false;
  // ThemePreferences _preferences = ThemePreferences();
  // bool get isDark => _isDark;
  //
  // ThemeModel() {
  //   _isDark = false;
  //   _preferences = ThemePreferences();
  //   getPreferences();
  // }
  //
  // set isDark(bool value) {
  //   _isDark = value;
  //   _preferences.setTheme(value);
  //   notifyListeners();
  // }
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode =>
      _themeMode == ThemeMode.light ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme() {
    print(themeMode.toString());

    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    print(themeMode.toString());
  }

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF5b5d61),
    // scaffoldBackgroundColor: const Color(0xff3450A1),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF5b5d61)),
    // appBarTheme: const AppBarTheme(backgroundColor: Color(0xff3450A1)),
    primaryColor: Colors.white,
    // cardColor: const Color(0xff0A155A),
    cardColor: const Color(0xFF3d3e40),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
    ),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    // scaffoldBackgroundColor: const Color(0xFF3d3e40),
    scaffoldBackgroundColor: const Color(0xffF4F6FD),
    primaryColor: Colors.black,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Color(0xFF002FFF)),
    // appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF3d3e40)),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xffF4F6FD)),
  );
}
