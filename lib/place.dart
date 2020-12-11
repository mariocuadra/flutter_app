import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/User/model/user_attribute.dart';

class Place {

  String id;
  String name;
  String description;
  String urlImage;
  int likes;
  DocumentReference  userOwner;

  Place({
    Key key,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    this.likes,
    this.userOwner
  });

}