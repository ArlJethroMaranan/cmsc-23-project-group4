import 'package:cmsc_23_proj/screens/not_found.dart';
import 'package:cmsc_23_proj/screens/users_view/donors_view/donors_donate.dart';
import 'package:cmsc_23_proj/screens/users_view/donors_view/donors_orgs.dart';
import 'package:cmsc_23_proj/screens/users_view/donors_view/donors_profile.dart';
import 'package:flutter/material.dart';

class DonorsMain extends StatefulWidget {
  const DonorsMain({super.key});

  @override
  State<DonorsMain> createState() => _DonorsMainState();
}

class _DonorsMainState extends State<DonorsMain> {
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
          return MaterialPageRoute(builder: (context) => const DonorsOrgs());
        } else if (settings.name == '/donors-donate'){
          return MaterialPageRoute(builder: (context) => const DonorsDonate());
        } else if (settings.name == '/donors-profile'){
          return MaterialPageRoute(builder: (context) => const DonorsProfile());
        } else {
          return MaterialPageRoute(builder: (context) => const NotFound());
        }
      },
    );
  }
}