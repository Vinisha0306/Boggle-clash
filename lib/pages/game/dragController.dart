import 'package:flutter/material.dart';

class DragController extends ChangeNotifier {
  bool boxAccepted = false;

  void boxAccept() {
    boxAccepted = true;
    notifyListeners();
  }
}
