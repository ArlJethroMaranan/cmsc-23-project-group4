import 'package:flutter/material.dart';

class Drawer2Widget extends StatefulWidget {
  const Drawer2Widget({super.key});

  @override
  State<Drawer2Widget> createState() => _Drawer2WidgetState();
}

class _Drawer2WidgetState extends State<Drawer2Widget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 232, 130, 57),
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Donators')),
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
              Navigator.pushNamed(context, '/donors-profile'); // push new route
            },
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context); // pop current
              Navigator.pushNamed(context, '/donors-org'); // push new route
              
              //Navigator.popUntil(context, ModalRoute.withName('/donationListOrg'));
            
            },
            title: const Text('See Organizations'),
          ),
        ],
      ),
    );
  }
}