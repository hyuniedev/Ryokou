import 'package:ryokou_service/entity/schedule.dart';

class Tour {
  late String _id;
  late String _name;
  late String _city;
  late int _durations;
  late DateTime _start;
  late int _maintainTime;
  late int _cost;
  late String _gatheringPlace;
  late String _freeService;
  late String _pointo;
  late String _kisoku;
  List<Schedule> _schedule = [];

  Tour({
    required String id,
    required String name,
    required String city,
    required int durations,
    required DateTime start,
    required int maintainTime,
    required int cost,
    required String gatheringPlace,
    required String freeService,
    required String pointo,
    required String kisoku,
    required List<Schedule> schedule,
  })  : _id = id,
        _name = name,
        _city = city,
        _durations = durations,
        _start = start,
        _maintainTime = maintainTime,
        _cost = cost,
        _gatheringPlace = gatheringPlace,
        _freeService = freeService,
        _pointo = pointo,
        _kisoku = kisoku,
        _schedule = schedule;


  Tour.empty() {
    _id = '';
    _name = '';
    _city = '';
    _durations = 0;
    _start = DateTime.now();
    _maintainTime = 0;
    _cost = 0;
    _gatheringPlace = '';
    _freeService = '';
    _pointo = '';
    _kisoku = '';
    _schedule = [];
  }

  // Getters
  String get id => _id;
  String get name => _name;
  String get city => _city;
  int get durations => _durations;
  DateTime get start => _start;
  int get maintainTime => _maintainTime;
  int get cost => _cost;
  String get gatheringPlace => _gatheringPlace;
  String get freeService => _freeService;
  String get pointo => _pointo;
  String get kisoku => _kisoku;
  List<Schedule> get schedule => _schedule;

  // Setters
  set id(String value) {
    _id = value;
  }

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

  set pointo(String value) {
    _pointo = value;
  }

  set kisoku(String value) {
    _kisoku = value;
  }

  set schedule(List<Schedule> value) {
    _schedule = value;
  }


  void addSchedule(Schedule newSchedule) {
    _schedule.add(newSchedule);
  }

  void removeSchedule(Schedule oldSchedule) {
    _schedule.remove(oldSchedule);
  }
}
