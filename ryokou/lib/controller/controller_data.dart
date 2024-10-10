import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ryokou/entity/rate.dart';
import 'package:ryokou/entity/user.dart';
import 'package:ryokou/entity/tour.dart';

class DataController {
  static final DataController _instance = DataController._singleton();
  DataController._singleton(); // contructor private
  factory DataController() {
    return _instance;
  }
  List<Tour> lsTour = [];

  User? _user;
  User? get getUser => _user;
  set setUser(User? initUser) => _user = initUser;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void LoadDataTour() async {
    lsTour = [];
    try {
      QuerySnapshot querySnapshot = await firestore.collection('tours').get();
      for (var doc in querySnapshot.docs) {
        Tour newTour = Tour.fromJson(doc.data() as Map<String, dynamic>);
        newTour.id = doc.id;
        QuerySnapshot queryRate = await firestore
            .collection('rates')
            .where('idTour', isEqualTo: newTour.id)
            .get();
        newTour.lsRate = queryRate.docs
            .map((item) => Rate.fromJson((item.data() as Map<String, dynamic>)))
            .toList();
        lsTour.add(newTour);
      }
    } catch (e) {
      print('Loi doc du lieu: $e');
    }
  }

  Tour findTour(String id) {
    return lsTour.firstWhere((element) => element.id == id);
  }
}
