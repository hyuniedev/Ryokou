import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ryokou/entity/rate.dart';
import 'package:ryokou/entity/user.dart';
import 'package:ryokou/entity/tour.dart';

class DataController {
  static final DataController _instance = DataController._singleton();
  DataController._singleton();
  factory DataController() {
    return _instance;
  }
  List<Tour> lsTour = [];
  List<String> lsIdTours = [];

  Tour? tourGoing;
  List<Tour> lsTourBought = [];
  List<Tour> lsTourGone = [];

  User? _user;
  User? get getUser => _user;
  set setUser(User? initUser) {
    _user = initUser;
    _divisionOfTour();
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
        QuerySnapshot queryRate = await firestore
            .collection('rates')
            .where('idTour', isEqualTo: newTour.id)
            .get();
        newTour.lsRate = queryRate.docs
            .map((item) => Rate.fromJson((item.data() as Map<String, dynamic>)))
            .toList();
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

  void _divisionOfTour() {
    if (_user == null) {
      return;
    } else {
      for (var index in _user!.getMyTour()) {
        DateTime endDate = index.start.add(Duration(days: index.durations));
        if (endDate.isAfter(DateTime.now())) {
          lsTourGone.add(index);
        } else if (index.start.isBefore(DateTime.now())) {
          lsTourBought.add(index);
        } else {
          tourGoing = index;
        }
      }
    }
  }

  //------------------RATE--------------------------
  void addNewRate(Rate newRate) async {
    DocumentReference querySnapshot =
        await firestore.collection('rates').add(newRate.toJson());
  }
  //------------------RATE--------------------------
}
