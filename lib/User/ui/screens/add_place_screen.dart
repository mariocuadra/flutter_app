import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:flutter_app/User/ui/screens/title_input_location.dart';
import 'package:flutter_app/card_image.dart';
import 'package:flutter_app/place.dart';
import 'package:flutter_app/widgets/button_purple.dart';
import 'package:flutter_app/widgets/gradient_back.dart';
import 'package:flutter_app/widgets/text_input.dart';
import 'package:flutter_app/widgets/title_header.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class AddPlaceScreen extends StatefulWidget {

PickedFile image;

AddPlaceScreen({
  Key key,
  this.image
});

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();

}

class _AddPlaceScreenState extends State<AddPlaceScreen> {



  @override



  Widget build(BuildContext context) {

    UserBloc userBloc =BlocProvider.of<UserBloc>(context);
    print('Entro a la clase addplacescreen');

    double left =0.0;
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();


    double screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(Dheight:300.0),
          Row( //AppBar
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top:30.0, left:5.0),
                child:SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child :Hero(
                    tag: 'agregar_fotos',
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 45,) ,

                    onPressed:(){
                      
                      Navigator.pop(context);

                    },
                  ),
                  )
                )
              ),
           Flexible(
            child: Container(
             padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
             child: TitleHeader("Add a new place"),
              )
            ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 85.0, bottom: 20.0),
            child: ListView(
              children: <Widget> [
                Container(
                  alignment:Alignment.center ,
                  child: CardImageWithFabIcon(
                    pathImage:widget.image.path,
                    iconData: Icons.camera_alt ,
                    widght: 350.0,
                    height: 200.0,
                    left: left,
                    ),
                ), //foto
                Container(
                  margin: EdgeInsets.only(top:20.0,  bottom: 20.0),
                  child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    maxLines: 1,
                    controller: _controllerTitlePlace,
                  ),
                ),
                TextInput( // Description
                  hintText:"Description",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerDescriptionPlace,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText:"Add location" ,
                    iconData: Icons.location_on,
                  ),
                ),
                  Container(
                    width: 70.0,
                    child:ButtonPurple(
                      buttonText: "Add Place",
                      onPressed: (){
                        //Firebase Storage
                        //Url
                        // ID del  Usuario que esta logeado actualmente.

                        userBloc.currentUsuario().then((User user) async {

                          if (user != null){

                              String uid = user.uid;
                              String path ="${uid}/${DateTime.now().toString()}.jpg";

                              File Nfile= File(widget.image.path);

                              final uploadTask = await userBloc.uploadFile('$uid/${DateTime.now().toString()}.jpg', Nfile);
                              if(uploadTask == null){
                                print('Null upload task');
                                return;
                              }


                             final  imageUrl = await firebase_storage.TaskState.success;
                              if(imageUrl == null){
                                print('Null image URL');
                                return;
                              }

                              print('Image url: $imageUrl');

                              //Cloud Firestore
                              //Place  - Title, description, utl userOwner, likes.
                              userBloc.updatePlaceData(Place(
                                name:_controllerTitlePlace.text,
                                description: _controllerDescriptionPlace.text,
                                likes: 0,
                                //urlImage: imageUrl,

                              )

                              ).whenComplete(() {
                                print("Termino");
                                Navigator.pop(context);

                              });



                          }



                        });




                      },
                    )
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
