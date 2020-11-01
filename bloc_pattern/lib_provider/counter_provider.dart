import 'package:flutter/foundation.dart';

enum CounterAction{Increment,Decrement,Reset}

class CounterProvider with ChangeNotifier{
  int _counter = 0;

  int get counter => _counter;

  set updateCounter(CounterAction action){
    if(action == CounterAction.Increment) _counter++;
    else if(action == CounterAction.Decrement) _counter--;
    else _counter = 0;
    notifyListeners();
  }
}