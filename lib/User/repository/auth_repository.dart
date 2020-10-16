import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/User/repository/firebase_auth.dart';

class AuthRepository{

  final   _firebaseAuthAPI = FireBaseAuthAPI();

  Future<UserCredential> signInFirebase() => _firebaseAuthAPI.signInWithGoogle();


}