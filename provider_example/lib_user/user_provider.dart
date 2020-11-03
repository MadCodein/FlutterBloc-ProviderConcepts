import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String _username;

  String get username => _username;

  set updateUi(String name) {
    if (name.isEmpty)
      _username = "Enter any text";
    else
      _username = name;
    notifyListeners();
  }
}
