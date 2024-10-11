import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ryokou/controller/controller_data.dart';
import 'package:ryokou/entity/enumSex/e_sex.dart';
import 'package:ryokou/entity/user.dart' as myuser;
import 'package:ryokou/firebase/data_firebase.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _ggSignIn = GoogleSignIn();

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
      myuser.User myUser = myuser.User(
        id: user?.uid,
        fullName: user?.displayName,
        email: user!.email!,
        numberphone: user.phoneNumber,
        sex: ESex.none,
      );
      saveData(myUser);
      DataController().setUser = myUser;
      return userCredential.user;
    } catch (e) {
      print('Error on signin: $e');
      return null;
    }
    return null;
  }

  Future<void> saveData(myuser.User user) async {
    await _firestore.collection('users').doc(user.id).set({
      'uid': user.id,
      'fullname': user.fullName,
      'numberphone': user.numberphone,
      'email': user.email,
      'sex': user.sex!.index,
    });
  }

  Future<User?> register(myuser.User user) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password!);
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

      DataController().setUser =
          await DataFirebase().getUser(userCredential.user!.uid);
      return userCredential.user;
    } catch (e) {
      print('CO LOI TRONG KHI DANG NHAP: $e');
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    DataController().setUser = null;
    await _auth.signOut();
  }
}
