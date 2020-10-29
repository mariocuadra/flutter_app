import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/User/model/user_attribute.dart';
import 'package:flutter_app/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository{

  final _cloudfirestoreApi = CloudFirestoreAPI();

  Future<void> addUserData(UserAttribute user) => _cloudfirestoreApi.addUser(user);

}