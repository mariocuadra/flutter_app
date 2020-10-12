import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreen createState() => _SignInScreen();

}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return signInGoogleUI();
  }

  Widget signInGoogleUI(){
      return Scaffold(
        body: Stack(
          alignment: Alignment.center,
            children: <Widget>[
            GradientBack("",null),
              Column(
                children: <Widget>[
                  Text("Bienvenido mathias",
                  style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  )
                 ,)
                ],
              )

          ],
        ),
      );

  }
}
