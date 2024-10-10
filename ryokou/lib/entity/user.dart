import 'package:ryokou/entity/enumSex/e_sex.dart';
import 'package:ryokou/entity/tour.dart';

class User {
  String? id;
  String? password;
  String? fullName;
  String? numberphone;
  String email;
  ESex? sex;
  List<Tour> _favoriteTour = [];
  List<Tour> get getFavoriteTours => _favoriteTour;
  set setFavoriteTour(List<Tour> lsTour) => _favoriteTour = lsTour;
  void addFavoriteTour(Tour newTour) {
    _favoriteTour.add(newTour);
  }

  void removeFavoriteTour(Tour delTour) {
    if (_favoriteTour.contains(delTour)) {
      _favoriteTour.remove(delTour);
    }
  }

  bool containsFavoriteTour(Tour findTour) {
    return _favoriteTour.contains(findTour);
  }

  User({
    this.id,
    this.password,
    this.fullName,
    required this.email,
    this.numberphone,
    this.sex,
  });

  // Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'password': password,
      'fullName': fullName,
      'numberphone': numberphone,
      'email': email,
      'sex': sex?.index, // Assuming ESex is an enum, store its index
      'favoriteTour': _favoriteTour.map((tour) => tour.toJson()).toList(),
    };
  }

  // Create a User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      password: json['password'],
      fullName: json['fullName'],
      numberphone: json['numberphone'],
      email: json['email'],
      sex: ESex.values[json['sex']], // Assuming sex is stored as an enum index
    ).._favoriteTour = (json['favoriteTour'] as List)
        .map((tour) => Tour.fromJson(tour))
        .toList(); // Convert each tour in the list
  }
}
