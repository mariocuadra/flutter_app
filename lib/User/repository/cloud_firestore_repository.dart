import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/User/model/user_attribute.dart';
import 'package:flutter_app/User/repository/cloud_firestore_api.dart';

import '../../place.dart';
import '../../profile_place.dart';

class CloudFirestoreRepository{

  final _cloudfirestoreApi = CloudFirestoreAPI();

  Future<void> addUserData(UserAttribute user) => _cloudfirestoreApi.addUser(user);
  
  Future<void> updatePlaceData(Place place) => _cloudfirestoreApi.updatePlaceData(place);


  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudfirestoreApi.buildPlaces(placesListSnapshot);



}