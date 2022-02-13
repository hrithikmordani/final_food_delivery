// ignore_for_file: unused_import, unused_element, unused_field, avoid_print

import 'package:final_food_delivery/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference usersdatabase =
      FirebaseFirestore.instance.collection('users');

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid, email: user.email);
  }

  String getUserId() {
    return _firebaseAuth.currentUser!.uid;
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return _userFromFirebase(credential.user);
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password, String contact, String name) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    User id = _userFromFirebase(credential.user)!;
    await usersdatabase
        .doc(id.uid)
        .set({'email': email, 'name': name, 'contact': contact})
        .then((value) => print('user added'))
        .catchError((error) => print('failed to add user: $error'));

    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
