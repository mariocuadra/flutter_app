import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseStorageAPI{


  Future<String> uploadFile (String path, File image) async {

    String imageUrl= 'Hola mundo';

    firebase_storage.Reference _storageReference = firebase_storage.FirebaseStorage.instance.ref();


    firebase_storage.UploadTask uploadTask =_storageReference.child(path).putFile(image);

    uploadTask.whenComplete(() async{

      try{

        imageUrl = await uploadTask.storage.ref(path).getDownloadURL();

         return imageUrl;

        //return imageUrlBack;
      }catch(onError){

        print("Error");
      }

      return imageUrl;

    });

    return imageUrl;

  }

}


