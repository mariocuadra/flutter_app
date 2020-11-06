
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/User/model/user_attribute.dart';

import '../../place.dart';

class CloudFirestoreAPI{

  final  String USERS ='users';
  final  String PLACE ="places";



  Future<void> addUser(UserAttribute user) async {

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return await users.add({
              'uid': user.uid,
              'name': user.name,
              'email': user.email,
              'photoURL': user.photoUrl,
              'myPlaces': user.myPlaces,
              'myFavoritePlaces': user.myFavoritePlaces,
              'lastSignIn': DateTime.now()
              })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }



  Future <void> updatePlaceData(Place place) async {

    final FirebaseAuth _auth = FirebaseAuth.instance;

    CollectionReference places = FirebaseFirestore.instance.collection('places');

    final User currUser = _auth.currentUser; /*Extraigo el usuario actual de la sesion*/

     return await places.add({
       'name': place.name,
       'description' : place.description,
       'likes' : place.likes,
       'userOwner' : "${USERS}/${currUser.uid}" //referencia

     });

  }

}