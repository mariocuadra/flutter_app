import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Place/repository/firebase_storage_repository.dart';
import 'package:flutter_app/User/model/user_attribute.dart';
import 'package:flutter_app/User/repository/auth_repository.dart';
import 'package:flutter_app/User/repository/cloud_firestore_repository.dart';
import 'package:flutter_app/User/repository/firebase_auth_api.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

import '../../place.dart';


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

  final _firebaseStorageRepository = FirebaseStorageRespository();

  Future<firebase_storage.Reference> uploadFile (String path, File image) => _firebaseStorageRepository.uploadFile(path, image);


  signOut(){

    _auth_repository.signOut();

  }


  @override
  void dispose() {
    // TODO: implement dispose
  }

}