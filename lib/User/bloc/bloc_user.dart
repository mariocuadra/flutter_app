import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Country/model/country.dart';
import 'package:flutter_app/Place/repository/firebase_storage_api.dart';
import 'package:flutter_app/User/model/user_attribute.dart';
import 'package:flutter_app/User/repository/auth_repository.dart';
import 'package:flutter_app/User/repository/cloud_firestore_api.dart';
import 'package:flutter_app/User/repository/cloud_firestore_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


import '../../place.dart';
import '../../profile_place.dart';


class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();

  //Flujo de datos -Streams

  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;

  /*Determinar el usuario actualmente logeado*/
  Future<User>  currentUsuario() async {

    User user = FirebaseAuth.instance.currentUser;

    return user;
  }



  //Caso Uso
  //1. SignIn a la aplicacion Google

  Future<User> signIn() {

    return _auth_repository.signInFirebase();

  }


  //2. registra usuario en base de datos.

  final _cloudFirestoreRepository = CloudFirestoreRepository();

  /*Registrar usuario en base de datos*/
  Future<void> addUserData(UserAttribute user) => _cloudFirestoreRepository.addUserData(user);

 /*Registrar lugares visitados por el usuario*/
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceData(place);
 // PlacesListStream es poner en escucha
  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance.collection(CloudFirestoreAPI().PLACE).snapshots(); //es una foto a la base de datos
 // se define otro stream para acceder a la escucha y poder reflejar la foto.

  Stream<QuerySnapshot> get placesStream => placesListStream; // este permite escuchar.

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot)  => _cloudFirestoreRepository.buildPlaces(placesListSnapshot);

      Stream<QuerySnapshot> myPlacesListStream(String uid) =>
      FirebaseFirestore.instance.collection(CloudFirestoreAPI().PLACE)
      .where("userOwner", isEqualTo: FirebaseFirestore.instance.doc("${CloudFirestoreAPI().USERS}/${uid}"))
      .snapshots();

  // rescata la informacion de los paises desde firebase.


  Stream<QuerySnapshot> myCountryListStream()=>
      FirebaseFirestore.instance.collection(CloudFirestoreAPI().COUNTRY).snapshots();

  Stream<QuerySnapshot> myCityListStream(String uid)=>
      FirebaseFirestore.instance.collection(CloudFirestoreAPI().CITY)
      .where("uidCountryRef", isEqualTo: FirebaseFirestore.instance.doc("${CloudFirestoreAPI().COUNTRY}/${uid}"))
      .snapshots();


  final _firebaseStorageRepository = FirebaseStorageRespository();
  Future<String> uploadFile (String path, File image) => _firebaseStorageRepository.uploadFile(path, image);

  signOut(){

    _auth_repository.signOut();

  }


  @override
  void dispose() {
    // TODO: implement dispose
  }

}