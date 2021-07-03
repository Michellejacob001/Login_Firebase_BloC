//regbloc is used for sign in page. Here it takes the sign in button only to consideration 

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart'; //for using the required keyword.

abstract class UserRegEvent extends Equatable {}

 class SignedUpButtonPressedEvent extends UserRegEvent {
  String email, password;
  

  SignedUpButtonPressedEvent({@required this.email, @required this.password});

  @override

  List<Object> get props => null;
}
