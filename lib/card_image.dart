import 'dart:io';

import 'package:flutter/material.dart';
import 'widgets/floating_action_button_green.dart';

class  CardImageWithFabIcon extends StatelessWidget {

  final double height;
  final double widght;
  final double left ;
  final String pathImage ;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;

  CardImageWithFabIcon({
        Key key,
        @required this.pathImage = "assets/img/beach_palm.jpeg" ,
        @required this.widght = 280.0,
        @required this.height =250.0,
        @required this.onPressedFabIcon,
        @required this.iconData,
        this.left

  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(

      height: 200,
      width: widght,
      margin: EdgeInsets.only(
         left: left,



      ),

      decoration: BoxDecoration(

        image: DecorationImage(
          fit: BoxFit.cover,


            image: pathImage.contains('assets')?
            AssetImage(pathImage):new FileImage(new File(pathImage)), // condiciona si existe la foto si la crea.


        ),

        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow (
            color:  Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]

      ),

    );

    return Stack(
      alignment: Alignment(0.9,1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(iconData: iconData, onPressed: onPressedFabIcon,)
      ],
    );
  }

}