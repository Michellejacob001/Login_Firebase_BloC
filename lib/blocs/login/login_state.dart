import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class LoginState extends Equatable { 
  FirebaseUser get user {
    //TODO- get user ADDED
    return user;
  }
}

class LoginInitialState extends LoginState{
  List<Object> get props => null;
}

@immutable
// ignore: must_be_immutable
class LoginLoadingState extends LoginState{
  FirebaseUser user;
  LoginLoadingState({
   this.user,
  });
  @override
  List<Object> get props => null;
}

// ignore: must_be_immutable
class LoginSuccessState extends LoginState {
 FirebaseUser user;
  LoginSuccessState({
    @required this.user,
  });

  List<Object> get props => null;
}

// ignore: must_be_immutable
class LoginFailureState extends LoginState{
  String message;
  LoginFailureState({
    @required this.message,
  });
  @override
  List<Object> get props => null;
}
