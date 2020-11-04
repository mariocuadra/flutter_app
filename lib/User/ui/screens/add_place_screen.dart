import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/gradient_back.dart';
import 'package:flutter_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {

File image;

AddPlaceScreen(this.image);

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();

}

class _AddPlaceScreenState extends State<AddPlaceScreen> {


  @override
  Widget build(BuildContext context) {
    print('Entro a la clase addplacescreen');
    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(Dheight:300.0),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top:30.0, left:5.0),
                child:SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child :Hero(
                    tag: 'agregar_fotos',
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 45,) ,

                    onPressed:(){
                      
                      Navigator.pop(context);

                    },
                  ),
                  )
                )
              ),
           Flexible(
            child: Container(
            padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
            child: TitleHeader("Add a new place"),
              )
            ),
            ],
          )
        ],
      ),
    );
  }
}
