import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_app/Place/repository/firebase_storage_api.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageRespository{

  final _firebaseStorageAPI = FirebaseStorageAPI();

  Future<firebase_storage.Reference> uploadFile (String path, File image) => _firebaseStorageAPI.uploadFile(path, image);



}