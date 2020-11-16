import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'firebase_storage_repository.dart';

class FirebaseStorageRespository{

  final _firebaseStorageAPI = FirebaseStorageAPI();

  Future<firebase_storage.Reference> uploadFile (String path, File image) => _firebaseStorageAPI.uploadFile(path, image);



}