import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseStorageAPI{

  final firebase_storage.Reference _storageReference = firebase_storage.FirebaseStorage.instance.ref();

  Future<firebase_storage.UploadTask> uploadFile (String path) async {

    File firebase_storage.UploadTask storageUploadTask = _storageReference.child(path).putFile(image,"image/jpeg");





  }



}