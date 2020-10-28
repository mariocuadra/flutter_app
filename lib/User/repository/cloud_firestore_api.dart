
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/User/model/user_attribute.dart';

class CloudFirestoreAPI{

  final  String USERS ="users";
  final  String PLACE ="places";


  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateUserData(UserAttribute user) {
    CollectionReference users = _firestore.collection(USERS);
    DocumentReference ref = users.doc(user.uid);
  }

}