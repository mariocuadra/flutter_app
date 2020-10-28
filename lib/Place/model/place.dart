
import 'package:flutter/material.dart';
import 'package:flutter_app/User/model/user_attribute.dart';

class Place {

  String id;
  String name;
  String descripcion;
  String uriImage;
  int likes;
  UserAttribute UserOwner;
  Place({
    Key key,
    @required this.name,
    @required this.descripcion,
    @required this.uriImage,
    this.likes,
    @required this.UserOwner
});

}