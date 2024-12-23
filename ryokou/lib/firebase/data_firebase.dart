import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/user.dart' as myuser;
import 'package:ryokou/entity/company.dart';

class DataFirebase {
  static final DataFirebase _instance = DataFirebase._singleton();
  DataFirebase._singleton();
  factory DataFirebase() {
    return _instance;
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _ggSignIn = GoogleSignIn();
  DocumentSnapshot? _doc;

  Future<User?> signinWithGoogleAccount() async {
    try {
      final GoogleSignInAccount? ggAccount = await _ggSignIn.signIn();

      if (ggAccount == null) {
        return null;
      }
      final GoogleSignInAuthentication ggAuth = await ggAccount.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: ggAuth.accessToken,
        idToken: ggAuth.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      var fetchedUser = await getUser(user!.uid);
      if (fetchedUser == null) {
        DataController().setUser = myuser.User(
            id: _doc!.id,
            email: user.email ?? '',
            fullName: user.displayName ?? '',
            numberphone: user.phoneNumber ?? '');
        await setUser();
      } else {
        DataController().setUser = fetchedUser;
      }
      return userCredential.user;
    } catch (e) {
      print('Error on signin by google: $e');
      return null;
    }
  }

  Future<User?> register(myuser.User user) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);
      user.id = result.user?.uid;
      DataController().setUser = user;
      DataFirebase().setUser();
      return result.user;
    } catch (e) {
      print('Loi khi dang ky: $e');
      return null;
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential? userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      DataController().setUser = await getUser(userCredential.user!.uid);
      return userCredential.user;
    } catch (e) {
      print('CO LOI TRONG KHI DANG NHAP: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    DataController().setUser = null;
    await _auth.signOut();
  }

  Future<Company?> getCompany(String id) async {
    DocumentSnapshot docCompany =
        await _firestore.collection('companys').doc(id).get();
    if (docCompany.exists) {
      return Company.fromJson(docCompany.data() as Map<String, dynamic>);
    } else {
      print('No company found for the given ID');
      return null;
    }
  }

  // late QuerySnapshot _docRefTour;
  // Future<Tour?> getTour(String id) async {
  //   _docRefTour ??=
  //       await (FirebaseFirestore.instance).collection('tours').get();
  //   DocumentSnapshot? docTour =
  //       await _docRefTour.docs.firstOrNull(id);
  //   if (docTour.exists) {
  //     return Tour.fromJson(docTour.data() as Map<String, dynamic>);
  //   } else {
  //     print('No tour found for the given ID');
  //     return null;
  //   }
  // }

  Future<myuser.User?> getUser(String id) async {
    _doc = await _firestore.collection('users').doc(id).get();
    if (_doc!.exists && _doc!.data() != null) {
      return myuser.User.fromJson(_doc!.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<void> setUser() async {
    if (DataController().getUser == null) return;
    try {
      await _firestore
          .collection('users')
          .doc(DataController().getUser!.id)
          .set(DataController().getUser!.toJson());
    } catch (e) {
      print('Error set data user: $e');
    }
  }
}
