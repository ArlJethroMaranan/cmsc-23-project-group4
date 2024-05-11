import 'package:cmsc_23_proj/screens/users_view/org_view/org_donoList.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/org_home.dart';
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
      //original route
      onGenerateRoute: (setting) {
        if(setting.name == '/'){ // route for slambook (originally the first route *but changed)
          return MaterialPageRoute(builder: (context) => const OrgHome());
        }
        else if(setting.name == '/second'){ // route for friends page which has a map parameter that will be from formpage
          //var args = setting.arguments as Map<String,String>? ?? {};
          return MaterialPageRoute(builder: (context) => const DonationList());
        }
        // else{ //extra route for error page
        //   return MaterialPageRoute(builder: (context) => const ErrorPage());
        // }
      },
    );
  }
}