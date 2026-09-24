import 'package:flutter/foundation.dart';

class NavigationController extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  // Changes the active bottom-navigation destination.
  void setIndex(int index) {
    if (_currentIndex == index) {
      return;
    }

    _currentIndex = index;

    // Notifies HomeDashboardScreen so the appropriate screen is displayed.
    notifyListeners();
  }
}
