import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:flutter_app/User/model/user_attribute.dart';
import 'package:flutter_app/users_info.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../../button_bar.dart';

class ProfileHeader extends StatelessWidget {

  UserAttribute userAttribute;

  ProfileHeader(@required this.userAttribute);


  @override
  Widget build(BuildContext context) {



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