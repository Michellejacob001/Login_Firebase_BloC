import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class UserRegState extends Equatable {}

class UserRegInitial extends UserRegState {
  @override
 
  List<Object> get props => null;
}

class UserLoadingState extends UserRegState {
  @override

  List<Object> get props => null;
}

class UserRegSuccessful extends UserRegState {
  FirebaseUser user;
  UserRegSuccessful({
    @required this.user
  });

  @override
 
  List<Object> get props => null;
}

class UserRegFailure extends UserRegState {
  String message;
  UserRegFailure({
    @required this.message,
  });
  @override
 
  List<Object> get props => null;
}
