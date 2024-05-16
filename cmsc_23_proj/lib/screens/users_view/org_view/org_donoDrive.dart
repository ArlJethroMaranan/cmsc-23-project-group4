import 'package:cmsc_23_proj/screens/users_view/org_view/drawer.dart';
import 'package:flutter/material.dart';

class DonationDrive extends StatefulWidget {
  const DonationDrive({super.key});

  @override
  State<DonationDrive> createState() => _DonationDriveState();
}

class _DonationDriveState extends State<DonationDrive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("DONATION DRIVE"),
        backgroundColor: Colors.blue, // Background color
        foregroundColor: Colors.white, // Text and icon color
      ),
    );
  }
}