import 'package:flutter/material.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
   UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      height: 280.0,
      child: StreamBuilder(
        stream: userBloc.placesStream,
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.active:
              return listViewPlaces(snapshot);
            case ConnectionState.done:
              return listViewPlaces(snapshot);
            default:
          }
        }
      )
    );
  }

}

Widget listViewPlaces(List<CardImageWithFabIcon> placesCard){

    return ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children:placesCard
    );
}

/*
ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children:
      ),
 */