import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/enumSex/e_sex.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/firebase/data_firebase.dart';

class User {
  String? id;
  String? password;
  String? fullName;
  String? numberphone;
  String email;
  ESex? sex;
  List<String> _favoriteTour = [];

  Future<List<Tour>> getFavoriteTours() async {
    List<Future<Tour?>> futureTours =
        _favoriteTour.map((item) => DataFirebase().getTour(item)).toList();

    List<Tour?> tours = await Future.wait(futureTours);

    return tours.where((tour) => tour != null).cast<Tour>().toList();
  }

  set setFavoriteTour(List<String> lsTour) => _favoriteTour = lsTour;
  void addFavoriteTour(Tour newTour) {
    print('Them Tour');
    _favoriteTour.add(newTour.id!);
    DataFirebase().setUser();
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
        sex: ESex.values[json['sex']] ?? ESex.none)
      .._favoriteTour =
          (json['favoriteTour'] as List<dynamic>? ?? []).cast<String>();
  }
}
