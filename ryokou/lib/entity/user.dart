import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/enumSex/e_sex.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/firebase/data_firebase.dart';

class User {
  String? id;
  String? password;
  String? fullName;
  String? numberphone;
  String? email;
  ESex? sex;
  List<String> _favoriteTour = [];
  List<String> _myTour = [];

  List<Tour> getFavoriteTours() {
    return _favoriteTour
        .map((item) => DataController().findTour(item))
        .toList();
  }

  List<Tour> getMyTour() {
    return _myTour.map((item) => DataController().findTour(item)).toList();
  }

  set setMyTour(List<String> lsTour) => _myTour = lsTour;

  set setFavoriteTour(List<String> lsTour) => _favoriteTour = lsTour;

  void addFavoriteTour(Tour newTour) {
    _favoriteTour.add(newTour.id!);
    DataFirebase().setUser();
  }

  void removeFavoriteTour(Tour delTour) {
    if (containsFavoriteTour(delTour)) {
      _favoriteTour.remove(delTour.id);
      DataFirebase().setUser();
    }
  }

  void addMyTour(Tour newTour) {
    _myTour.add(newTour.id!);
    DataFirebase().setUser();
  }

  void removeMyTour(Tour delTour) {
    if (containsFavoriteTour(delTour)) {
      _myTour.remove(delTour.id);
      DataFirebase().setUser();
    }
  }

  bool containsFavoriteTour(Tour findTour) {
    return _favoriteTour.contains(findTour.id);
  }

  bool containsMyTour(Tour findTour) {
    return _myTour.contains(findTour.id);
  }

  User({
    this.id,
    this.password,
    this.fullName,
    required this.email,
    this.numberphone,
    this.sex,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'numberphone': numberphone,
      'email': email,
      'sex': sex?.index,
      'favoriteTour': _favoriteTour,
      'myTour': _myTour,
    };
  }

  // Create a User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] ?? '',
        fullName: json['fullName'] ?? '',
        numberphone: json['numberphone'] ?? '',
        email: json['email'] ?? '',
        sex: ESex.values[json['sex'] ?? 2])
      .._favoriteTour =
          (json['favoriteTour'] as List<dynamic>? ?? []).cast<String>()
      .._myTour = (json['muTour'] as List<dynamic>? ?? []).cast<String>();
  }
}
