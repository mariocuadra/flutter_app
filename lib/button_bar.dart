import 'package:flutter/material.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            //cambiar la contrasena
            CircleButton(true, Icons.vpn_key, 20.0, Color.fromRGBO(255, 255, 255, 1), ()=>{}),
            //se agrega un nuevo lugar
            CircleButton(true, Icons.add, 20.0, Color.fromRGBO(255, 255, 255, 0.6),()=>{}),
            //cerrar sesion
            CircleButton(false, Icons.exit_to_app, 40.0, Color.fromRGBO(255, 255, 255, 1),()=>{}),
          ],
        )
    );
  }

}