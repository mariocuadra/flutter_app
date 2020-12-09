import 'package:flutter/material.dart';

class Place {
  String id;
  String name;
  String descripcion;
  String urlImage;
  int likes;
  String UserOwner;

  Place(
      {Key key,
      @required this.name,
      @required this.descripcion,
      this.urlImage,
      this.likes,
      this.UserOwner});
}
