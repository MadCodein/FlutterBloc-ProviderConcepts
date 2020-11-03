import 'package:flutter/foundation.dart';
import '../provider/validation_item.dart';

class MessageProvider with ChangeNotifier {
  ValidationItem _subject = ValidationItem(null, null);
  ValidationItem _message = ValidationItem(null, null);

  ValidationItem get subject => _subject;
  ValidationItem get message => _message;

  //check entire form validity
  bool get isValid {
    if (_subject.value != null && _message.value != null) {
      return true;
    }
    return false;
  }

  get done {
    _subject = ValidationItem(null, null);
    _message = ValidationItem(null, null);
  }

  set subjectInput(String newSubject) {
    if (newSubject.isEmpty) {
      _subject = ValidationItem(null, "This field is required!");
    } else
      _subject = ValidationItem(newSubject, null);
    notifyListeners();
  }

  set messageInput(String newMessage) {
    if (newMessage.isEmpty) {
      _message = ValidationItem(null, "This field is required!");
    } else
      _message = ValidationItem(newMessage, null);
    notifyListeners();
  }
}
