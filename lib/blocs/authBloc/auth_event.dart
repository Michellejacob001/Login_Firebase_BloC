import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class AppStartedEvent extends AuthEvent {
  //to show the splash screen which stays for like 2 sec when firebase is checking if logged in or not
  @override
  List<Object> get props => null; 
}
