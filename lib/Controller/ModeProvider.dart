// Theme Provider for Dark Mode
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = true;
  bool isfaved = true;
  ThemeMode get themeMode => isDarkMode ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void toggleFavorate() {
    isfaved = !isfaved;
    notifyListeners();
  }
}
