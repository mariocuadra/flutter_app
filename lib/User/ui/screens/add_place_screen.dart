import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/gradient_back.dart';

class AddPlaceScreen extends StatefulWidget {

File image;

AddPlaceScreen(this.image);

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(Dheight:300.0),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top:25.0, left:5.0),
                child:SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.add_to_photos, color: Colors.white, size: 45,) ,
                    onPressed: ,
                  )
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
