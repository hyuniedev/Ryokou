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

  List<Tour> getFavoriteTours() {
    return _favoriteTour
        .map((item) => DataController().findTour(item))
        .toList();
  }

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

  bool containsFavoriteTour(Tour findTour) {
    return _favoriteTour.contains(findTour.id);
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
          (json['favoriteTour'] as List<dynamic>? ?? []).cast<String>();
  }
}
