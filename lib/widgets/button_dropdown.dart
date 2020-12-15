import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Country/model/country.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';


class ButtonDropDown extends StatefulWidget {

  String  country;
  String city;



  List<DropdownMenuItem> countryItems = [];
  ButtonDropDown({ Key key, @required this.country, this.city

    });




  @override
  _ButtonDropDownState createState() => _ButtonDropDownState();

}


class _ButtonDropDownState extends State<ButtonDropDown> {

  List<Country> _dropdownItems = [];

 List<Country> initLoad() {

    UserBloc userBloc =BlocProvider.of<UserBloc>(context);

    StreamBuilder(
        stream: userBloc.myCountryListStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          for (int i = 0; i < snapshot.data.docs.length; i++) {
            DocumentSnapshot snap = snapshot.data.docs[i];

            _dropdownItems[i].id=snap.id;
            _dropdownItems[i].name=snap.get('Pais');


          }


        }
    );
        return _dropdownItems;

  }

  List<DropdownMenuItem<Country>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<Country>> items = List();
    for (Country listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {




  }
}