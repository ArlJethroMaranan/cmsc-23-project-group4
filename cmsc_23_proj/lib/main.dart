import 'package:cmsc_23_proj/screens/auth_pages/auth_main.dart';
import 'package:cmsc_23_proj/screens/admin_view/admin_main.dart';
import 'package:cmsc_23_proj/screens/not_found.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/org_donoList.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/org_home.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/org_profile.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        colorScheme: ThemeData.dark().colorScheme.copyWith(
          background: Colors.grey[900],
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[800],
        ),
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/'){
          return MaterialPageRoute(builder: (context) => const AuthMain());
        } else {
          return MaterialPageRoute(builder: (context) => const NotFound());
        }
      },
    );
  }
}
