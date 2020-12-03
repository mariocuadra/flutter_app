import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/User/model/user_attribute.dart';

class Place {
  String id;
  String name;
  String descripcion;
  String urlImage;
  int likes;
  String UserOwner;
  String pais;
  String ciudad;

  Place(
      {Key key,
      @required this.name,
      @required this.descripcion,
      this.urlImage,
      this.likes,
      this.UserOwner,
      this.pais,
      this.ciudad});
}
