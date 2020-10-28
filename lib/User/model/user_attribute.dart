import 'package:flutter/material.dart';
import 'package:flutter_app/Place/model/place.dart';

class UserAttribute {

  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final List<Place> myPlaces;
  final List<Place> myFavoritePlaces;


  // myfavoritePlace
 // Myplaces.

  UserAttribute({

        Key key,
        @required this.uid,
        @required this.name,
        @required this.email,
        @required this.photoUrl,
        this.myPlaces,
        this.myFavoritePlaces
      });
}