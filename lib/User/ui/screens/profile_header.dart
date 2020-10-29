import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:flutter_app/User/model/user_attribute.dart';
import 'package:flutter_app/users_info.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../../button_bar.dart';

class ProfileHeader extends StatelessWidget {

  UserBloc userBloc;
  UserAttribute userAttribute;

  @override
  Widget build(BuildContext context) {

    userBloc=BlocProvider.of<UserBloc>(context);

    //StreamBuilder es un codigo que permite mantener alerta respecto de los estados de los demas API como google o firebase
    return StreamBuilder(
    stream: userBloc.streamFirebase, // el flujo de alerta
    builder:(BuildContext context, AsyncSnapshot snapshot){
      switch (snapshot.connectionState) {
         case ConnectionState.waiting:
         case ConnectionState.none:
              return CircularProgressIndicator(); //barra de progreso
        case ConnectionState.active:
        case ConnectionState.done:
          return showProfieData(snapshot);
      }
    },
    );
  }

  Widget showProfieData(AsyncSnapshot snapshot){

    if (!snapshot.hasData || snapshot.hasError) {
      print("No logeado");
      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No fue posible cargar la informacion, haz login")
                     ],
        ),
      );

    }else{
        print("Logeado");
        userAttribute = UserAttribute(name: snapshot.data.displayName, email: snapshot.data.email, photoUrl: snapshot.data.photoUrl);
        print(snapshot.data);


        final title = Text(
          'Profile',
          style: TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0
          ),
        );

        return Container(
      margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
            ],
          ),
          UsersInfo(userAttribute),
          ButtonsBar()
        ],
      ),
    );
    }

  }

}