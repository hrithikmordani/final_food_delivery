import 'package:flutter/material.dart';

class User {
  String? uid;
  String? email;
  num? contact;
  String? name;

  User({this.uid, this.email, this.contact, this.name});
  factory User.fromMap(map) {
    return User(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      contact: map['contact'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'contact': contact,
    };
  }
}
