import 'package:cmsc_23_proj/screens/auth_pages/sign_in.dart';
import 'package:cmsc_23_proj/screens/auth_pages/sign_up/sign_up_main.dart';
import 'package:cmsc_23_proj/screens/auth_pages/sign_up/sign_up_org.dart';
import 'package:cmsc_23_proj/screens/not_found.dart';
import 'package:flutter/material.dart';

class AuthMain extends StatefulWidget {
  const AuthMain({super.key});

  @override
  State<AuthMain> createState() => _AuthMainState();
}

class _AuthMainState extends State<AuthMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/'){
          return MaterialPageRoute(builder: (context) => const UserSignIn());
        } else if (settings.name == '/sign-up'){
          return MaterialPageRoute(builder: (context) => const UserSignUp());
        } else if (settings.name == '/sign-up-org'){
          return MaterialPageRoute(builder: (context) => const UserSignUpOrg());
        }  
        else {
          return MaterialPageRoute(builder: (context) => const NotFound());
        }
      },
    );
  }
}