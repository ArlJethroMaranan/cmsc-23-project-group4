import 'package:cmsc_23_proj/screens/not_found.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/org_donoDrive.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/org_donoList.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/org_home.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/org_profile.dart';
import 'package:flutter/material.dart';

class OrgMain extends StatefulWidget {
  const OrgMain({super.key});

  @override
  State<OrgMain> createState() => _OrgMainState();
}

class _OrgMainState extends State<OrgMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        if(settings.name == '/'){ // route for slambook (originally the first route *but changed)
          return MaterialPageRoute(builder: (context) => const OrgHome());
        } else if(settings.name == '/donationListOrg'){ // route for friends page which has a map parameter that will be from formpage
          //var args = setting.arguments as Map<String,String>? ?? {};
          return MaterialPageRoute(builder: (context) => const DonationList());
        } else if(settings.name == '/profileOrg'){ // route for friends page which has a map parameter that will be from formpage
          //var args = setting.arguments as Map<String,String>? ?? {};
          return MaterialPageRoute(builder: (context) => const ProfileOrg());
        } else if(settings.name == '/driveOrg') {
          return MaterialPageRoute(builder: (context) => const DonationDrive());
        } else {
          return MaterialPageRoute(builder: (context) => const NotFound());
        }
      },
    );
  }
}