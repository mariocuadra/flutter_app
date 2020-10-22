import 'package:flutter/material.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../../user_info.dart';
import '../../../button_bar.dart';

class ProfileHeader extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc=BlocProvider.of<UserBloc>(context);

    //StreamBuilder es un codigo que permite mantener alerta respecto de los estados de los demas API como google o firebase
    return StreamBuilder(
    stream: userBloc.streamFirebase,
    builder:(BuildContext context, AsyncSnapshot snapshot){
      switch (snapshot.connectionState) {
         case ConnectionState.waiting:
         case ConnectionState.none:
              return CircularProgressIndicator(); //barra de progreso
        case ConnectionState.active:
        case ConnectionState.done:
          return null;
      }
    },
    );
/*    final title = Text(
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
              title
            ],
          ),
          UserInfo('assets/img/ann.jpg', 'Anahí Salgado','anahi@platzi.com'),
          ButtonsBar()
        ],
      ),
    );*/
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
    }

  }

}