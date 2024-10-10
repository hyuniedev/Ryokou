import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ryokou_service/entity/tour.dart';

class DataController {
    static final DataController _instance = DataController.singleton();
  DataController.singleton();
  factory DataController(){
    return _instance;
  }

  List<Tour> _lsTour = [];
  List<Tour> get lsTour => _lsTour;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // List<Tour> LoadDataTour(List<String> lsIdTour){
  //   print('Load data but: ${lsIdTour.length}');
  //   lsIdTour.forEach((item)async{DocumentSnapshot doc = await _firestore.collection('tours').doc(item).get(); DataController()._lsTour.add(Tour.fromJson(doc.data() as Map<String, dynamic>));});
  //   return _lsTour;
  // }
  
}