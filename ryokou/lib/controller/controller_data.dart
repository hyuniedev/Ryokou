import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/entity/user.dart';

class DataController {
  static final DataController _instance = DataController._singleton();
  DataController._singleton(); // contructor private
  factory DataController() {
    return _instance;
  }

  User? _user;
  User? get getUser => _user;
  set setUser(User? initUser) => _user = initUser;

  Tour tour = Tour(
      titleTour: 'titleTour',
      descriptionTour: 'descriptionTour',
      duration: 3,
      location: 'location');

  List<Tour> proposeTours = [
    Tour(
        titleTour: 'titleTour',
        descriptionTour: 'descriptionTour',
        duration: 23,
        location: 'location'),
    Tour(
        titleTour: 'titleTour',
        descriptionTour: 'descriptionTour',
        duration: 23,
        location: 'location'),
    Tour(
        titleTour: 'titleTour',
        descriptionTour: 'descriptionTour',
        duration: 23,
        location: 'location'),
    Tour(
        titleTour: 'titleTour',
        descriptionTour: 'descriptionTour',
        duration: 23,
        location: 'location'),
    Tour(
        titleTour: 'titleTour',
        descriptionTour: 'descriptionTour',
        duration: 23,
        location: 'location'),
    Tour(
        titleTour: 'titleTour',
        descriptionTour: 'descriptionTour',
        duration: 23,
        location: 'location'),
    Tour(
        titleTour: 'titleTour',
        descriptionTour: 'descriptionTour',
        duration: 23,
        location: 'location'),
    Tour(
        titleTour: 'titleTour',
        descriptionTour: 'descriptionTour',
        duration: 23,
        location: 'location'),
    Tour(
        titleTour: 'titleTour',
        descriptionTour: 'descriptionTour',
        duration: 23,
        location: 'location'),
    Tour(
        titleTour: 'titleTour',
        descriptionTour: 'descriptionTour',
        duration: 23,
        location: 'location'),
    Tour(
        titleTour: 'titleTour',
        descriptionTour: 'descriptionTour',
        duration: 23,
        location: 'location')
  ];
}
