import 'package:ryokou/entity/enumSex/e_sex.dart';
import 'package:ryokou/entity/tour.dart';

class User {
  late String id;
  late String userName;
  late String password;
  late String fullName;
  late String numberphone;
  late String email;
  late ESex sex;
  final List<Tour> _favoriteTour = [];
  List<Tour> get getFavoriteTours => _favoriteTour;
  set addFavoriteTour(Tour newTour) => _favoriteTour.add(newTour);

  User({
    required this.userName,
    required this.password,
    required this.fullName,
    required this.email,
    required this.numberphone,
    required this.sex,
  });
}
