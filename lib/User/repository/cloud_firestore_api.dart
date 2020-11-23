
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/User/model/user_attribute.dart';
import 'package:flutter_app/profile_place.dart';

import '../../place.dart';

class CloudFirestoreAPI {

  final String USERS = 'users';
  final String PLACE = "places";


  Future<void> addUser(UserAttribute user) async {
    DocumentReference users = FirebaseFirestore.instance.collection("${USERS}").doc(user.uid);


    return await users.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoUrl,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true))
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }


  Future <void> updatePlaceData(Place place) async {

    final FirebaseAuth _auth = FirebaseAuth.instance;

    CollectionReference places = FirebaseFirestore.instance.collection("${PLACE}");
    CollectionReference users = FirebaseFirestore.instance.collection("${USERS}");

    final User currUser = _auth
        .currentUser; /*Extraigo el usuario actual de la sesion*/

    return await places.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'urlImage': place.urlImage,
      'userOwner': '${USERS}/${currUser.uid}', //referencia

    }).then((DocumentReference dr) {
      dr.get().then((DocumentSnapshot snapshot) {
        DocumentReference placeref=snapshot.reference; //Id place referencia Arra*/

        DocumentReference refUsers = users.doc(currUser.uid) ;//_auth.currentUser.uid as DocumentReference;

        print(" referencia _ $refUsers.id");

        refUsers.update({
          'myPlaces' : FieldValue.arrayUnion([placeref])

        }).catchError((error) => print("Failed to add reference: $error"));

      });
    });
  }

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot){

    List<ProfilePlace> profilePlaces = List<ProfilePlace>();

    placesListSnapshot.forEach((element) {

      profilePlaces.add(ProfilePlace(
          Place(
                name: element.data()['name'],
                description: element.data()['description'],
                urlImage: element.data()['urlImage'],)
                //userOwner: element.reference()['userOwner'],),
          ),
      );
    });

    return profilePlaces;
  }
}