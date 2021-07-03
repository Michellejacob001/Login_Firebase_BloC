import 'package:bloc/bloc.dart';
import 'package:firebase_login_tatos7/repositories/user_repository.dart';
import 'package:meta/meta.dart';
import 'login_state.dart';
import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;
  LoginBloc({
    @required this.userRepository,
  });
  @override
  LoginState get initialState => LoginInitialState();

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    try {
      if (event is LoginButtonPressedEvent) {
        yield LoginLoadingState();
        var user = await userRepository.signInUser(event.email, event.password);
        yield LoginSuccessState(user: user);
      }
    } catch (e) {
      yield LoginFailureState(message: e.toString());
    }
  }
}
