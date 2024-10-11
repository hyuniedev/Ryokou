import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/company.dart';
import 'package:ryokou/entity/tour.dart';
import 'package:ryokou/entity/user.dart';

class DataFirebase {
  static final DataFirebase _instance = DataFirebase._singleton();
  DataFirebase._singleton();
  factory DataFirebase() {
    return _instance;
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Company?> getCompany(String id) async {
    DocumentSnapshot doc =
        await _firestore.collection('companys').doc(id).get();
    if (doc.exists) {
      // Nếu tài liệu tồn tại, trả về đối tượng Company
      return Company.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      // Nếu tài liệu không tồn tại, trả về null hoặc một giá trị mặc định
      print('No company found for the given ID');
      return null;
    }
  }

  Future<Tour?> getTour(String id) async {
    DocumentSnapshot doc = await _firestore.collection('tours').doc(id).get();
    if (doc.exists) {
      return Tour.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      print('No tour found for the given ID');
      return null;
    }
  }

  Future<User> getUser(String id) async {
    DocumentSnapshot doc = await _firestore.collection('users').doc(id).get();
    return User.fromJson(doc.data() as Map<String, dynamic>);
  }

  Future<void> setUser() async {
    print('Set Data ne');
    if (DataController().getUser == null) return;
    try {
      await _firestore
          .collection('users')
          .doc(DataController().getUser!.id)
          .set(DataController().getUser!.toJson());
      print('Set xong roi nay');
    } catch (e) {
      print('Error set data user: $e');
    }
  }
}
