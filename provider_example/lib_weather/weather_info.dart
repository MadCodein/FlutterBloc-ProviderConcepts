import 'package:flutter/foundation.dart';

class WeatherInfo with ChangeNotifier{

  String _tempType = "celcius";
  int _tempval = 25;

  int get temperatureVal => _tempval;

  String get temperatureType => _tempType;

  set updateTemperatureVal(int newTemp) {
    _tempval = newTemp;
    notifyListeners();
  }

  set updateTemperatureType(String newType){
    _tempType = newType;
    notifyListeners();
  }
}