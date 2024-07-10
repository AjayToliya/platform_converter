import 'package:flutter/material.dart';

class PlateformProvider extends ChangeNotifier {
  bool isIos = false;

  void togglePlateform() {
    isIos = !isIos;
    notifyListeners();
  }
}
