
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/User/model/user_attribute.dart';

class CloudFirestoreAPI{

  final  String USERS ="users";
  final  String PLACE ="places";
  final bool merge =true;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateUserData(UserAttribute user) async {


   }

}