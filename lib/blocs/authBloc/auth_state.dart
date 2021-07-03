import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  
  List<Object> get props => null;
}

class AuthenticatedState extends AuthState {
  FirebaseUser user;
  
  AuthenticatedState({@required this.user});
  @override
 
  List<Object> get props => null;
}

class UNAuthenticatedState extends AuthState {
  @override

  List<Object> get props => null;
}
