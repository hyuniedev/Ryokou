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
}
