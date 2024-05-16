import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 232, 130, 57),
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Organization')),
          ListTile(
            onTap:() {
              Navigator.pop(context); // pop current
              Navigator.pushNamed(context, '/'); // push new route
            },
            title: const Text('Home'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context); // pop current
              Navigator.pushNamed(context, '/profileOrg'); // push new route
            },
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context); // pop current
              Navigator.pushNamed(context, '/donationListOrg'); // push new route
            },
            title: const Text('Donation List'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context); // pop current
              Navigator.pushNamed(context, '/driveOrg'); // push new route
            },
            title: const Text('Donation Drives'),
          ),
        ],
      ),
    );
  }
}