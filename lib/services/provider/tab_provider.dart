import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  int currentIndex = 0;

  updateIndex(index) {
    currentIndex = index;
    
    notifyListeners();
  }
}
