
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/User/model/user_attribute.dart';

class CloudFirestoreAPI{

  final  String USERS ='users';
  final  String PLACE ="places";

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(UserAttribute user) {

    return users
        .add({'uid':user.uid,
              'name':user.name,
              'email':user.email,
              'photoURL': user.photoUrl,
              'myPlaces': user.myPlaces,
              'myFavoritePlaces': user.myFavoritePlaces,
              'lastSignIn': DateTime.now()
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

  }

}