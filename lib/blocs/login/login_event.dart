//login pages login button
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {}

class LoginButtonPressedEvent extends LoginEvent {
  String email, password;
  LoginButtonPressedEvent({
    @required this.password, @required this.email
  });
  @override
 
  List<Object> get props => null;
}
