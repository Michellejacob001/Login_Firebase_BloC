import 'package:firebase_login_tatos7/blocs/authBloc/auth_bloc.dart';
import 'package:firebase_login_tatos7/blocs/authBloc/auth_state.dart';
import 'package:firebase_login_tatos7/repositories/user_repository.dart';
import 'package:firebase_login_tatos7/ui/pages/home_page.dart';
import 'package:firebase_login_tatos7/ui/pages/login_page.dart';
import 'package:firebase_login_tatos7/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/authBloc/auth_event.dart';
import 'package:meta/meta.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AuthBloc(userRepository: userRepository)..add(AppStartedEvent()),
        child: Appp(userRepository: userRepository,),
      ),
    );
  }
}

class Appp extends StatelessWidget {

  UserRepository userRepository;

  Appp({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitialState) {
          return SplashPage();
        } else if (state is AuthenticatedState) {
          return HomePageParent(user: state.user, userRepository: userRepository);
        } else if (state is UNAuthenticatedState) {
          return LoginPageParent(userRepository: userRepository);
        }
      },
    );
  }
}
