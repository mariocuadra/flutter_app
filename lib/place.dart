import 'package:flutter/material.dart';
import 'package:flutter_app/User/model/user_attribute.dart';

class Place {

  String id;
  String name;
  String description;
  String urlImage;
  int likes;
  UserAttribute userOwner;

  Place({
    Key key,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    this.likes,
    @required this.userOwner
  });

}