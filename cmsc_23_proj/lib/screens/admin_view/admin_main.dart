import 'package:cmsc_23_proj/screens/admin_view/admin_OrgApproval.dart';
import 'package:cmsc_23_proj/screens/admin_view/admin_homePage.dart';
import 'package:cmsc_23_proj/screens/admin_view/admin_viewDonors.dart';
import 'package:cmsc_23_proj/screens/admin_view/admin_viewOrgDona.dart';
import 'package:flutter/material.dart';

class AdminMain extends StatefulWidget {
  const AdminMain({super.key});

  @override
  State<AdminMain> createState() => _AdminMainState();
}

class _AdminMainState extends State<AdminMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Admin View",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),

      onGenerateRoute: (setting){
        if(setting.name == '/'){
          return MaterialPageRoute(builder: (context) => AdminHomePage());
        }else if(setting.name == '/ViewDonorsPage'){
          return MaterialPageRoute(builder: (context) => ViewDonorsPage());
        }else if(setting.name == '/ViewOrgsDonaPage'){
          return MaterialPageRoute(builder: (context) => ViewOrgsDonaPage());
        }else if(setting.name == '/OrgApprovalPage'){
          return MaterialPageRoute(builder: (context) => OrgApprovalPage());
        }
      },

    );
  }
}