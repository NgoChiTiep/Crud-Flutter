import 'dart:async';

class ActionAccountBloc {
  StreamController _validateController = new StreamController<String>.broadcast();
  Stream get validateStream => _validateController.stream;

  bool isValidate(String userName, String gender, String relationship) {
    if (userName == '') {
      _validateController.sink.add('Name may not be blank');
      return false;
    }
    if (gender == null) {
      _validateController.sink.add('Gender may not be blank');
      return false;
    }
    if (relationship == '') {
      _validateController.sink.add("Relationship may not be blank");
      return false;
    }
    return true;
  }

  void dispose(){
    _validateController.close();
  }
}
