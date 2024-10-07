
class ToDoOnDay {
  late String _hour;
  late String _minute;
  late String _content;

  ToDoOnDay({
    required String hour,
    required String minute,
    required String content,
  })  : _hour = hour,
        _minute = minute,
        _content = content;

  ToDoOnDay.empty();
  // Getters
  String get hour => _hour;
  String get minute => _minute;
  String get content => _content;

  // Setters
  set hour(String value) {
    _hour = value;
  }
  set minute(String value) {
    _minute = value;
  }
  set content(String value) {
    _content = value;
  }

  Map<String, dynamic> toJson(){
    return {
      'hour' : _hour,
      'minute' : _minute,
      'content' : _content,
    };
  }

  factory ToDoOnDay.fromJson(Map<String,dynamic> json){
    return ToDoOnDay(hour: json['hour'], minute: json['minute'], content: json['content']);
  }

}
