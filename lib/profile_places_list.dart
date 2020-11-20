
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'User/bloc/bloc_user.dart';
import 'profile_place.dart';
import 'place.dart';

class ProfilePlacesList extends StatelessWidget {

  UserBloc userBloc;

  Place place = new Place(
    name: "Knuckles Mountains Range",
    description: "Hiking. Water fall hunting. Natural bath",
    urlImage: "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
      likes: 3
  );
  Place place2 = Place(
      name: "Mountains",
      description: "Hiking. Water fall hunting. Natural bath', 'Scenery & Photography",
      urlImage: "https://images.unsplash.com/photo-1524654458049-e36be0721fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
      likes: 10
  );

  @override
  Widget build(BuildContext context) {

    userBloc  = BlocProvider.of<UserBloc>(context);

    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child:StreamBuilder(
        stream: userBloc.placesListStream,
        builder:  (context, AsyncSnapshot snapshot){

          if (snapshot != null ) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new CircularProgressIndicator();
              case ConnectionState.done:
              //snapshot.data.documents.map()
                return Column(
                  children: userBloc.buildPlaces(snapshot.data.documents),
                );
              case ConnectionState.active:
                return Column(
                  children: userBloc.buildPlaces(snapshot.data.documents),
                );
              case ConnectionState.none:
                return new CircularProgressIndicator();
              default:
                return Column(
                  children: userBloc.buildPlaces(snapshot.data.documents),
                );
            }
          }
        }, // lo que se devuelve del stream

      ),
    );
  }


}

//Column(
//children: <Widget>[
//ProfilePlace( place),
//ProfilePlace(place2),
//],