import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/rate.dart';
import 'package:ryokou/entity/schedule.dart';

class Tour {
  late String? _id;
  late String _name;
  late String _city;
  late int _durations;
  late DateTime _start;
  late int _maintainTime;
  late String _cost;
  late int _sale;
  late String _gatheringPlace;
  late bool _freeService;
  late String _pointo;
  late String _kisoku;
  List<Schedule> _schedule = [];
  List<String> _lsFile = [];
  List<Rate> _lsRate = [];
  late String _company;
  late DateTime _end;
  Tour({
    required String name,
    required String city,
    required int durations,
    required DateTime start,
    required int maintainTime,
    required String cost,
    required int sale,
    required String gatheringPlace,
    required bool freeService,
    required String pointo,
    required String kisoku,
    required List<Schedule> schedule,
    required List<String> lsFile,
    required String company,
  })  : _name = name,
        _city = city,
        _durations = durations,
        _start = start,
        _maintainTime = maintainTime,
        _cost = cost,
        _sale = sale,
        _gatheringPlace = gatheringPlace,
        _freeService = freeService,
        _pointo = pointo,
        _kisoku = kisoku,
        _schedule = schedule,
        _lsFile = lsFile,
        _company = company {
    _end = start.add(Duration(days: durations));
  }

  Tour.empty() {
    _id = '';
    _name = '';
    _city = '';
    _durations = 0;
    _start = DateTime.now();
    _maintainTime = 0;
    _cost = '';
    _sale = 0;
    _gatheringPlace = '';
    _freeService = false;
    _pointo = '';
    _kisoku = '';
    _schedule = [];
    _lsFile = [];
    _company = '';
    _end = start;
  }

  // Getters
  String? get id => _id;
  String get name => _name;
  String get city => _city;
  int get durations => _durations;
  DateTime get start => _start;
  DateTime get end => _end;
  int get maintainTime => _maintainTime;
  String get cost => _cost;
  int get sale => _sale;
  String get gatheringPlace => _gatheringPlace;
  bool get freeService => _freeService;
  String get pointo => _pointo;
  String get kisoku => _kisoku;
  List<Schedule> get schedule => _schedule;
  List<String> get lsFile => _lsFile;
  List<Rate> get lsRate => _lsRate;
  String get company => _company;

  String getPriceTour({int soLuong = 1}) {
    int originalPrice = int.parse(_cost.replaceAll('.', ''));

    double discountAmount = originalPrice * (_sale / 100);

    final formatter = NumberFormat("#,##0", "en_US");

    return formatter
        .format((originalPrice - discountAmount) * soLuong)
        .replaceAll(',', '.');
  }

  // Setters
  set id(String? value) {
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
    _end = _start.add(Duration(days: _durations));
  }

  set end(DateTime value) {
    _end = value;
  }

  set maintainTime(int value) {
    _maintainTime = value;
  }

  set cost(String value) {
    _cost = value;
  }

  set sale(int value) {
    _sale = value;
  }

  set gatheringPlace(String value) {
    _gatheringPlace = value;
  }

  set freeService(bool value) {
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

  set lsFile(List<String> value) {
    _lsFile = value;
  }

  set lsRate(List<Rate> value) {
    _lsRate = value;
  }

  set company(String value) {
    _company = value;
  }

  void addSchedule(Schedule newSchedule) {
    _schedule.add(newSchedule);
  }

  void removeSchedule(Schedule oldSchedule) {
    _schedule.remove(oldSchedule);
  }

  void addRate(Rate newRate) {
    newRate.nameUser = DataController()
        .getUser!
        .fullName; // thêm tên người dùng hiện tại để hiển thị luôn trong phiên đăng nhập này
    lsRate.add(newRate);
    DataController().addNewRate(newRate);
  }

  factory Tour.fromJson(Map<String, dynamic> json) {
    return Tour(
      name: json['name'] ?? '',
      city: json['city'] ?? '',
      durations: json['durations'] ?? 0,
      start: (json['start'] as Timestamp).toDate(),
      maintainTime: json['maintainTime'] ?? 0,
      cost: json['cost'] ?? '',
      sale: json['sale'] ?? 0,
      gatheringPlace: json['gatheringPlace'] ?? '',
      freeService: json['freeService'] ?? false,
      pointo: json['pointo'] ?? '',
      kisoku: json['kisoku'] ?? '',
      company: json['company'] ?? '',

      // Kiểm tra xem "schedule" có null không, nếu null thì gán danh sách rỗng
      schedule: (json['schedule'] != null)
          ? (json['schedule'] as List<dynamic>)
              .map((item) => Schedule.fromJson(item as Map<String, dynamic>))
              .toList()
          : [],

      // Kiểm tra nếu lsFile là null, nếu null thì gán danh sách rỗng
      lsFile: (json['lsFile'] != null) ? List<String>.from(json['lsFile']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': _name,
      'city': _city,
      'durations': _durations,
      'start': Timestamp.fromDate(_start),
      'maintainTime': _maintainTime,
      'cost': _cost,
      'sale': _sale,
      'gatheringPlace': _gatheringPlace,
      'freeService': _freeService,
      'pointo': _pointo,
      'kisoku': _kisoku,
      'schedule': _schedule.map((sche) => sche.toJson()).toList(),
      'lsFile': _lsFile,
      'company': _company,
    };
  }

  double getRateStar() {
    double rate = 0;
    for (var item in _lsRate) {
      rate += item.star;
    }
    return rate == 0
        ? 0
        : double.parse((rate / (_lsRate.length * 1.0)).toStringAsFixed(1));
  }
}
