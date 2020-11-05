import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/User/ui/screens/title_input_location.dart';
import 'package:flutter_app/card_image.dart';
import 'package:flutter_app/widgets/gradient_back.dart';
import 'package:flutter_app/widgets/text_input.dart';
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

    double left =20.0;
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriotionPlace = TextEditingController();


    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(Dheight:300.0),
          Row( //AppBar
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
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: <Widget> [
                Container(
                  alignment:Alignment.center ,
                  child: CardImageWithFabIcon(
                    pathImage:"assets/img/beach_palm.jpeg",  //widget.image.path,
                    iconData: Icons.camera_alt ,
                    widght: 350.0,
                    height: 250.0,
                    left: left,
                    ),
                ), //foto
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    maxLines: 1,
                    controller: _controllerTitlePlace,
                  ),
                ),
                TextInput( // Description
                  hintText:"Description",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerDescriotionPlace,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText:"Add location" ,
                    iconData: Icons.location_on,
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
