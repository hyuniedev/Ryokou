import 'package:ryokou_service/entity/to_do_onDay.dart';

class Schedule {
  late String _day;
  List<ToDoOnDay> _todo = [];

  Schedule({
    required String day,
    required List<ToDoOnDay> todo,
  })  : _day = day,
        _todo = todo;

  
  // Getters
  String get day => _day;
  List<ToDoOnDay> get todo => _todo;

  // Setters
  set day(String value) {
    _day = value;
  }

  set todo(List<ToDoOnDay> value) {
    _todo = value;
  }

  void addToDo(ToDoOnDay newToDo) {
    _todo.add(newToDo);
  }
}
