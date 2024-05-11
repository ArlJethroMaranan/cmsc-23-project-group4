import 'package:flutter/material.dart';

class OrgHome extends StatefulWidget {
  const OrgHome({super.key});

  @override
  State<OrgHome> createState() => _OrgHomeState();
}

class _OrgHomeState extends State<OrgHome> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    // drawer: DrawerWidget(map: friends),
    appBar: AppBar(
      title: const Text("ORGANIZATION HOME PAGE"),
      backgroundColor: Colors.blue, // Background color
      foregroundColor: Colors.white, // Text and icon color
    ),
    body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                onPressed: () {},
                backgroundColor: Colors.blue, // Background color of the button
                label: const Text('Go to Profile'),
                icon: const Icon(Icons.account_circle),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                onPressed: () {},
                backgroundColor: Colors.blue, // Background color of the button
                label: const Text('See Donations'),
                icon: const Icon(Icons.attach_money_rounded),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                onPressed: () {},
                backgroundColor: Colors.blue, // Background color of the button
                label: const Text('Donation Drives'),
                icon: const Icon(Icons.add_to_drive_outlined),
              ),
            ],
          )
        ],
      ),
   );   
  }
}