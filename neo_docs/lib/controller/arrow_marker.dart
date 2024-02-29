import 'package:flutter/material.dart';

class ArrowPositionProvider extends ChangeNotifier {
  double _arrowPosition = 0;

  double get arrowPosition => _arrowPosition;

  void updateArrowPosition(double newPosition) {
    _arrowPosition = newPosition;
    notifyListeners();
  }
}
