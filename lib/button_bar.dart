import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:flutter_app/User/ui/screens/add_place_screen.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    //se instancia la variable provider
    userBloc=BlocProvider.of(context);
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
            CircleButton(true, Icons.add, 20.0, Color.fromRGBO(255, 255, 255, 0.6),()
            {

              File image;
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext) => AddPlaceScreen(image),

              ));


            }),
            //cerrar sesion
            CircleButton(false, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 1),()=>{
              userBloc.signOut()
            }),

          ],
        )
    );
  }

}