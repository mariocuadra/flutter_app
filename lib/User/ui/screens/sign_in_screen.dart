import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:flutter_app/User/model/user_attribute.dart';
import 'package:flutter_app/User/repository/firebase_auth_api.dart';
import 'package:flutter_app/platzi_trips_cupertino.dart';
import 'package:flutter_app/users_info.dart';
import 'package:flutter_app/widgets/gradient_back.dart';
import 'package:flutter_app/widgets/button_green.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreen createState() => _SignInScreen();

}

class _SignInScreen extends State<SignInScreen> {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc=BlocProvider.of(context);

    return _handleCurrentSession();
  }


  Widget _handleCurrentSession() {
    return StreamBuilder(
      //detecta si la sesion cambia de estado
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {

          //Ejecucion de trigger de pantallas
          return signInGoogleUI();
        } else {
          return PlatziTripsCupertino();
        }
      },
    );
  }

  Widget signInGoogleUI(){
      return Scaffold(
        body: Stack(
          alignment: Alignment.center,
            children: <Widget>[
            GradientBack("",null),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Bienvenido ",
                  style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                 ),
                  ButtonGreen(text: "Login with gmail",
                      onPressed: ( ) {
                    userBloc.signOut();
                    FireBaseAuthAPI user;
                    userBloc.signIn().then((user) {
                      userBloc.addUserData( UserAttribute(
                        uid: user.uid,
                        name: user.displayName,
                        email: user.email,
                        photoUrl: user.photoURL
                      ));
                    });
                  },


                    width: 300.0,
                    height: 50.0,
                  )
                ],
              )

          ],
        ),
      );

  }
}
