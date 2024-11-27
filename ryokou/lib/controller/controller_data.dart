import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ryokou/entity/rate.dart';
import 'package:ryokou/entity/tour_booked.dart';
import 'package:ryokou/entity/user.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/firebase/data_firebase.dart';

class DataController {
  static final DataController _instance = DataController._singleton();
  DataController._singleton();
  factory DataController() {
    return _instance;
  }
  List<Tour> lsTour = [];
  List<String> lsIdTours = [];

  TourBooked? tourGoing;
  List<TourBooked> lsTourBought = [];
  List<TourBooked> lsTourGone = [];

  User? _user;
  User? get getUser => _user;
  set setUser(User? initUser) {
    _user = initUser;
    divisionOfTour();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> loadDataTour() async {
    try {
      lsTour = [];
      QuerySnapshot querySnapshot = await firestore.collection('tours').get();
      for (var doc in querySnapshot.docs) {
        Tour newTour = Tour.fromJson(doc.data() as Map<String, dynamic>);
        if (lsIdTours.contains(doc.id)) {
          continue;
        } else {
          newTour.id = doc.id;
          lsIdTours.add(doc.id);
        }
        // Lấy các rate của tour
        QuerySnapshot queryRate = await firestore
            .collection('rates')
            .where('tour', isEqualTo: newTour.id)
            .get();
        // Thêm các Rate vào tour
        newTour.lsRate = queryRate.docs
            .map((item) => Rate.fromJson((item.data() as Map<String, dynamic>)))
            .toList();
        // Duyệt các tour để lấy tên của người viết rate
        newTour.lsRate.forEach((iRate) async {
          iRate.nameUser = (await DataFirebase().getUser(iRate.user))?.fullName;
        });
        lsTour.contains(newTour) ? null : lsTour.add(newTour);
      }
    } catch (e) {
      print('Loi doc du lieu: $e');
    }
  }

  Future<List<Tour>> getListTour() async {
    if (lsTour.isEmpty) {
      await loadDataTour();
      return lsTour;
    } else {
      return lsTour;
    }
  }

  Tour findTour(String id) {
    return lsTour.firstWhere((element) => element.id == id);
  }

  void divisionOfTour() {
    lsTourBought = [];
    lsTourGone = [];
    if (_user == null) {
      return;
    } else {
      for (var index in _user!.getMyTour()) {
        if (index.end.isBefore(DateTime.now())) {
          print('${index.name}: ${index.end.toString()} - ${index.durations}');
          lsTourGone.add(index);
        } else if (index.start.isAfter(DateTime.now())) {
          lsTourBought.add(index);
        } else {
          tourGoing = index;
        }
      }
    }
  }

  bool checkDuplicateTour(Tour checkTour) {
    if (tourGoing != null && checkTour.start.isBefore(tourGoing!.end)) {
      return false;
    }
    for (Tour i in lsTourBought) {
      print('CheckTour: ${checkTour.start} - ${checkTour.end}');
      print('Tour ${i.name}: ${i.start} - ${i.end}');
      if (!(checkTour.start.isAfter(i.end) ||
          checkTour.end.isBefore(i.start))) {
        return false;
      }
    }
    return true;
  }

  //------------------RATE--------------------------
  void addNewRate(Rate newRate) async {
    DocumentReference querySnapshot = firestore.collection('rates').doc();

    newRate.id = querySnapshot.id;

    await querySnapshot.set(newRate.toJson());
  }
  //------------------RATE--------------------------
}
