import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';
import 'package:firebase_login_tatos7/blocs/homePageBloc/home_page_event.dart';
import 'package:firebase_login_tatos7/blocs/homePageBloc/home_page_state.dart';
import 'package:firebase_login_tatos7/repositories/user_repository.dart';
import 'package:meta/meta.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  UserRepository userRepository;
  HomePageBloc({
    @required this.userRepository,
  });
  @override 
  HomePageState get initialState => LogOutInitial();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async*{
   if(event is LogOutButtonPressedEvent){
     await userRepository.signOut();
     yield LogOutSuccess();
   }
  }
}
