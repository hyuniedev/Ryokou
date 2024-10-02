import 'package:flutter/material.dart';

class ToDoOnDay {
  late DateTime _date;
  late String _content;

  ToDoOnDay({
    required DateTime date,
    required String content,
  })  : _date = date,
        _content = content;

  ToDoOnDay.empty();
  // Getters
  DateTime get date => _date;
  String get content => _content;

  // Setters
  set date(DateTime value) {
    _date = value;
  }

  set content(String value) {
    _content = value;
  }
}
