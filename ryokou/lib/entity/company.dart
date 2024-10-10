import 'package:ryokou/entity/tour.dart';

class Company {
  late String? _id;
  String? get id => _id;
  late String? _name;
  String? get name => _name;
  late String? _numberphone;
  String? get numberphone => _numberphone;
  late String _email;
  String get email => _email;
  List<Tour> _lsTour = [];
  List<Tour> get lsTour => _lsTour;
  set lsTour(List<Tour> value) {
    _lsTour = value;
  }

  Company({
    String? id,
    String? name,
    String? numberphone,
    required String email,
  })  : _id = id,
        _name = name,
        _email = email,
        _numberphone = numberphone;
  void addTour(Tour newTour) {
    _lsTour.add(newTour);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'numberphone': numberphone,
      'tours': lsTour.map(
        (e) => e.id,
      )
    };
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        numberphone: json['numberphone']);
  }
}
