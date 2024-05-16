import 'package:cmsc_23_proj/screens/users_view/org_view/drawer.dart';
import 'package:flutter/material.dart';

class ProfileOrg extends StatefulWidget {
  const ProfileOrg({super.key});

  @override
  State<ProfileOrg> createState() => _ProfileOrgState();
}

class _ProfileOrgState extends State<ProfileOrg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("PROFILE"),
        backgroundColor: Colors.blue, // Background color
        foregroundColor: Colors.white, // Text and icon color
      ),
    );
  }
}
