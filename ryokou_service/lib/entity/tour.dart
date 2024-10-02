import 'package:ryokou_service/entity/schedule.dart';

class Tour {
  // Biến private
  late String _name;
  late String _city;
  late int _durations;
  late DateTime _start;
  late int _maintainTime;
  late int _cost;
  late String _gatheringPlace;
  late String _freeService;
  List<Schedule> _schedule = [];

  Tour({
    required String name,
    required String city,
    required int durations,
    required DateTime start,
    required int maintainTime,
    required int cost,
    required String gatheringPlace,
    required String freeService,
    required List<Schedule> schedule,
  })  : _name = name,
        _city = city,
        _durations = durations,
        _start = start,
        _maintainTime = maintainTime,
        _cost = cost,
        _gatheringPlace = gatheringPlace,
        _freeService = freeService,
        _schedule = schedule;

  Tour.empty() {
    _schedule = []; // Khởi tạo danh sách rỗng cho _schedule
  }

  void addSchedule(Schedule newSchedule) {
    _schedule.add(newSchedule);
  }

  void removeSchedule(Schedule oldSchdule) {
    _schedule.remove(oldSchdule);
  }

  // Getters
  String get name => _name;
  String get city => _city;
  int get durations => _durations;
  DateTime get start => _start;
  int get maintainTime => _maintainTime;
  int get cost => _cost;
  String get gatheringPlace => _gatheringPlace;
  String get freeService => _freeService;
  List<Schedule> get schedule => _schedule;

  // Setters
  set name(String value) {
    _name = value;
  }

  set city(String value) {
    _city = value;
  }

  set durations(int value) {
    _durations = value;
  }

  set start(DateTime value) {
    _start = value;
  }

  set maintainTime(int value) {
    _maintainTime = value;
  }

  set cost(int value) {
    _cost = value;
  }

  set gatheringPlace(String value) {
    _gatheringPlace = value;
  }

  set freeService(String value) {
    _freeService = value;
  }

  set schedule(List<Schedule> value) {
    _schedule = value;
  }
}
