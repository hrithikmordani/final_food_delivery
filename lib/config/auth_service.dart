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

  Future<Map<String, dynamic>> getData(userId) async {
    DocumentSnapshot documentSnapshot = await usersdatabase.doc(userId).get();
    final Map<String, dynamic> data =
        documentSnapshot.data() as Map<String, dynamic>;
    return data;
  }

  Future<void> increaseQuantity(cart, userId, itemName) {
    cart[itemName] = cart[itemName] + 1;
    return usersdatabase
        .doc(userId)
        .update({'cart': cart})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> addToCartInDatabase(cart, cartList, userId) {
    return usersdatabase
        .doc(userId)
        .update({'cart': cart, 'cartList': cartList})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> removeFromDatabase(cart, cartList, itemName, userId) {
    if (cart[itemName] > 1) {
      cart[itemName] = cart[itemName] - 1;
    } else {
      cartList.remove(itemName);
      cart.remove(itemName);
    }
    return usersdatabase
        .doc(userId)
        .update({'cart': cart, 'cartList': cartList})
        .then((value) => print('user updated'))
        .catchError((error) => print('error'));
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password, String contact, String name) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    User id = _userFromFirebase(credential.user)!;
    await usersdatabase
        .doc(id.uid)
        .set({
          'email': email,
          'name': name,
          'contact': contact,
          'cart': {},
          'cartList': []
        })
        .then((value) => print('user added'))
        .catchError((error) => print('failed to add user: $error'));

    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
