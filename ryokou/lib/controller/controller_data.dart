import 'package:ryokou/entity/user.dart';

class DataController {
  static final DataController _instance = DataController._singleton();
  DataController._singleton(); // contructor private
  factory DataController() {
    return _instance;
  }

  User? _user = null;
  User? get user => _user;
  set user(User? initUser) => _user = initUser;
}
