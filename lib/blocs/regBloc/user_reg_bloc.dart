import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'user_reg_event.dart';
import 'user_reg_state.dart';
import 'package:firebase_login_tatos7/repositories/user_repository.dart';


class UserRegBloc extends Bloc<UserRegEvent, UserRegState> {
  UserRepository userRepository;
  UserRegBloc({
    @required this.userRepository,
  });

  @override
  
  UserRegState get initialState => UserRegInitial();

  @override
  Stream<UserRegState> mapEventToState(UserRegEvent event) async* {
    try{
      if (event is SignedUpButtonPressedEvent) { // if this is the EVENT
      yield UserLoadingState(); //then this STATE should happen
      var user = await userRepository.createUser(event.email, event.password);
      yield UserRegSuccessful(user: user);
    }
    }
    catch(e){
      yield UserRegFailure(message: e.toString());
    }
    }
  }

