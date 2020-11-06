import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/User/model/user_attribute.dart';
import 'package:flutter_app/User/repository/auth_repository.dart';
import 'package:flutter_app/User/repository/cloud_firestore_repository.dart';
import 'package:flutter_app/User/repository/firebase_auth_api.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import '../../place.dart';


class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();

  //Flujo de datos -Streams

  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;



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


  signOut(){

    _auth_repository.signOut();

  }


  @override
  void dispose() {
    // TODO: implement dispose
  }

}