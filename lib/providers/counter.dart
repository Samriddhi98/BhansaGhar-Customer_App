import "package:flutter/material.dart";


class Counter with ChangeNotifier {
  int _counter = 1;

  getCounter() => _counter;

  setCounter(int counter) => _counter = counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter == 1 ? 
    _counter :
    _counter--; 
    notifyListeners();
  }
}