import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/services.dart'; //to be used when platform eception used
//import 'package:FirebaseUserSignIn/utils/error_codes.dart';

class UserRepository {
  //possible use cases in the app
  FirebaseAuth firebaseAuth; //instance of firebase

  UserRepository() {
    this.firebaseAuth = FirebaseAuth.instance;
  }

  Future<FirebaseUser> createUser(String email, String password) async {
    // to Register user
    //function for email and password
    try {
      //because possiblity of errors happening is there, used to identify that
      var result = await firebaseAuth.createUserWithEmailAndPassword(
          //since future is used, await id required, return if <void> is not there
          email: email,
          password: password);
      return result.user; //user holds the email and password
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<FirebaseUser> signInUser(String email, String password) async {
    // to signin user
    var result = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  Future<void> signOut() async {
    //to sign out
    //void coz it doent return anything
    await firebaseAuth.signOut();
  }

  Future<bool> isSignedIn() async {
    //to check if signedin or not
    var currentUser = await firebaseAuth
        .currentUser(); //currentuser returns user obj if user is signed in and returns null if user is not signedin
    return currentUser != null; //shows that user is signed in coz notnull
  }

  Future<FirebaseUser> getCurrentUser() async {
    //to get the curent user
    return await firebaseAuth.currentUser();
  }
}
