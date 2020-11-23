import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:flutter_app/User/model/user_attribute.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'profile_header.dart';
import '../../../profile_places_list.dart';
import '../../../profile_background.dart';

class ProfileTrips extends StatelessWidget {

  UserBloc userBloc;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder (

      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){

        switch (snapshot.connectionState){

          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
          default:



        }

      }
    );

  }


  Widget showProfileData(AsyncSnapshot snapshot){

    if (!snapshot.hasData || snapshot.hasError){
      print("No logeado");
      return Stack(
              children: <Widget>[
                ProfileBackground(),
                ListView(
                  children: <Widget>[
                    Text("Usuario no logeado, Haz login")
                  ],
                )
              ],
      );

  }else{

      print("logeado");
      var userAttribute = UserAttribute(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email:  snapshot.data.email,
        photoUrl: snapshot.data.photoUrl
      );

      return  Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(userAttribute), // User datos
              ProfilePlacesList(userAttribute) //User uid
            ],
          )
        ],
      );






    }

  }
}