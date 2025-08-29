import 'package:flutter/cupertino.dart';

// Using `with` instead of `extends` means CounterProvider is *mixing in*
// the ChangeNotifier behavior without being forced to inherit all of its structure.
// ChangeNotifier is the key part of Provider's observer pattern:
// it lets us call `notifyListeners()` so any widget listening to this provider will rebuild.
class CounterProvider with ChangeNotifier {
  // 1- State variable: the piece of data we want to expose & manage across the app.
  //    In this example, it's just a simple integer counter.
  int counter = 0;

  // 2- Business logic: functions that change the state.
  //    After mutating state, we call `notifyListeners()` so that
  //    all listening widgets know they need to rebuild.

  void increment() {
    counter++;
    notifyListeners(); // tell listeners: "state changed, rebuild if you depend on me"
  }

  void decrement() {
    counter--;
    notifyListeners();
  }

  void reset() {
    counter = 0;
    notifyListeners();
  }
}
