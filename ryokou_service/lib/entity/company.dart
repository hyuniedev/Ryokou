import 'package:ryokou_service/entity/tour.dart';

class Company {
  late String? _id;
  String? get id => _id;
  late String? _name;
  String? get name => _name;
  late String? _numberphone;
  String? get numberphone => _numberphone;
  late String _email;
  String get email => _email;
  late String? _password;
  String? get password => _password;
  Company(
      { String? id,
       String? name,
       String? numberphone,
       required String email,
       String? password})
      : _id = id,
        _name = name,
        _email = email,
        _numberphone = numberphone,
        _password = password;
  List<Tour> _lsTour = [];
  void addTour(Tour newTour) {
    _lsTour.add(newTour);
  }
}
