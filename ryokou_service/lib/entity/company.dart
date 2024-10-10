import 'package:ryokou_service/controller/data_controller.dart';
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
  List<String> _lsTour = [];
  List<String> get lsTour => _lsTour;
  set lsTour(List<String> value){
    _lsTour = value;
  }
  Company(
      { required String? id,
       String? name,
       String? numberphone,
       required String email,})
      : _id = id,
        _name = name,
        _email = email,
        _numberphone = numberphone;
  void addTour(String newTour) {
    _lsTour.add(newTour);
  }

  Map<String,dynamic> toJson(){
    return {
      'id' : id,
      'name' : name,
      'email' : email,
      'numberphone' : numberphone,
      'tours' : _lsTour,
    };
  }

  factory Company.fromJson(Map<String, dynamic> json)  {
  return Company(
    id: json['id'],
    email: json['email'],
    name: json['name'] ?? '', 
    numberphone: json['numberphone'] ?? '', 
  )
  ..lsTour = (json['tours'] != null) 
    ? (json['tours'] as List<dynamic>).map((e) => e.toString()).toList()
    : [];
}

}
