import 'package:ryokou/entity/user.dart';

class DataController {
  static final DataController _instance = DataController._singleton();
  DataController._singleton(); // contructor private
  factory DataController() {
    return _instance;
  }

  User? _user;
  User? get getUser => _user;
  set setUser(User? initUser) => _user = initUser;
}
