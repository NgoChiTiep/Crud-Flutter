import 'package:flutter/cupertino.dart';

class Counter with ChangeNotifier {
  int count = 0;

  int get getCount => count;

  plus() {
    count++;
    notifyListeners();
  }
}