//homepage now mainly used for logging out. it will be the page after logging in. 

import 'package:equatable/equatable.dart';

abstract class HomePageEvent extends Equatable{

}

class LogOutButtonPressedEvent extends HomePageEvent{
  @override

  List<Object> get props => null;
}
