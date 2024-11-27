import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/enumSex/e_sex.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/entity/tour_booked.dart';
import 'package:ryokou/firebase/data_firebase.dart';

class User {
  String? id;
  String? password;
  String? fullName;
  String? numberphone;
  String? email;
  ESex? sex;
  List<String> _favoriteTour = [];
  List<TourBooked> _myTour = [];

  List<Tour> getFavoriteTours() {
    return _favoriteTour
        .map((item) => DataController().findTour(item))
        .toList();
  }

  List<TourBooked> getMyTour() {
    return _myTour
        .map((item) => TourBooked(
            idTour: item.idTour,
            numPerson: item.numPerson,
            startDay: item.startDay))
        .toList();
  }

  set setMyTour(List<TourBooked> lsTour) => _myTour = lsTour;

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

  void addMyTour(TourBooked newTour) {
    _myTour.add(newTour);
    DataFirebase().setUser();
  }

  void removeMyTour(TourBooked delTour) {
    if (containsFavoriteTour(delTour)) {
      _myTour.remove(delTour);
      DataFirebase().setUser();
    }
  }

  bool containsFavoriteTour(Tour findTour) {
    return _favoriteTour.contains(findTour.id);
  }

  bool containsMyTour(TourBooked findTour) {
    return _myTour.contains(findTour);
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
      'myTour': _myTour.map((tour) => tour.toJson()).toList(),
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
      .._myTour = (json['myTour'] as List<dynamic>? ?? [])
          .map((tour) => TourBooked.fromJson(tour as Map<String, dynamic>))
          .toList();
  }
}
