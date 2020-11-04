import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {

  final String title;

  TitleHeader(@required this.title);


  @override
  Widget build(BuildContext context) {


    return Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),

    );
  }
}
