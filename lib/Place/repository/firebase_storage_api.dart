import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseStorageAPI{

  final firebase_storage.Reference _storageReference = firebase_storage.FirebaseStorage.instance.ref();

  Future<firebase_storage.Reference> uploadFile (String path, File image) async {

    if (image == null){

      print("No fue posible subir el archivo");
      return null;

    }
    _storageReference.child(path).putFile(image);
    print("creo la ruta de la imagen $path");

    return _storageReference;




  }



}