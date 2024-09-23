import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/enumSex/e_sex.dart';
import 'package:ryokou/entity/user.dart' as myuser;

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> register(myuser.User user) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      user.id = result.user!.uid;
      await _firestore.collection('users').doc(result.user!.uid).set({
        'username': user.userName,
        'fullname': user.fullName,
        'numberphone': user.numberphone,
        'email': user.email,
        'sex': user.sex.index,
      });
      DataController().setUser = user;
      return result.user;
    } catch (e) {
      print('Loi khi dang ky');
      return null;
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential? userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      DocumentSnapshot doc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      if (doc.exists) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
        DataController().setUser = myuser.User(
            userName: "username",
            password: password,
            fullName: data?['fullname'],
            email: email,
            numberphone: data?['numberphone'],
            sex: ESex.values[(data?['sex'])]);
      } else {}
      return userCredential.user;
    } catch (e) {
      print('CO LOI TRONG KHI DANG NHAP');
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    DataController().setUser = null;
    await _auth.signOut();
  }
}
