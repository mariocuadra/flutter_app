import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ButtonDropDown extends StatefulWidget {


  @override
  _ButtonDropDownState createState() => _ButtonDropDownState();

}


class _ButtonDropDownState extends State<ButtonDropDown> {


  @override
  Widget build(BuildContext context) {
    var _selectedCountry;
    final String USERS = 'users';
    List<DropdownMenuItem> countryItems = [];

    StreamBuilder<QuerySnapshot>(

      stream: FirebaseFirestore.instance.collection("${USERS}").snapshots(),
      builder: (context, snapshot){

        if(!snapshot.hasData){

          Text("Loading");

        } else {

          for (int i=0; i< snapshot.data.docs.length;i++){

            DocumentSnapshot snap= snapshot.data.docs[i];

                print(snap.id);
                countryItems.add(
                DropdownMenuItem(
                  child: Text(
                    snap.id,
                  ),
                  value: "${snap.id}",

                ));
          }


        }
      },
    );

    return Container(



       child: DropdownButton(
          items: countryItems ,
          onChanged: (countryValue){
            setState(() {
              _selectedCountry = countryValue;
            });
          },
         value: _selectedCountry ,
         isExpanded: false,
      ),

     );
  }
}


