import 'package:bloc/bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:meta/meta.dart';
import 'package:firebase_login_tatos7/repositories/user_repository.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository userRepository;
 
   AuthBloc({@required UserRepository userRepository}) {
    this.userRepository = userRepository;
  }

  @override
  AuthState get initialState => AuthInitialState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async*{

    if(event is AppStartedEvent)
    {
     try{
        var isSignedIn = await userRepository.isSignedIn(); // returns true if signed in and flase if not
      if(isSignedIn){ //if true i.e signed in
        var user=await userRepository.getCurrentUser();
        yield AuthenticatedState(user: user);
      }
      else
        yield UNAuthenticatedState();
     }
     catch(e){
       yield UNAuthenticatedState();
     }
    }
  }
}
