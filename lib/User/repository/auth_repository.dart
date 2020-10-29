

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/User/repository/firebase_auth_api.dart';

class AuthRepository{

  final   _firebaseAuthAPI = FireBaseAuthAPI();


  Future<String> signInFirebase() => _firebaseAuthAPI.signInWithGoogle();


  signOut() => _firebaseAuthAPI.signOut();


}