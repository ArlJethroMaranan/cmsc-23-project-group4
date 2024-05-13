import 'package:cmsc_23_proj/screens/users_view/org_view/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrgHome extends StatefulWidget {
  const OrgHome({Key? key}) : super(key: key);

  @override
  State<OrgHome> createState() => _OrgHomeState();
}

class _OrgHomeState extends State<OrgHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("ORGANIZATION"),
        backgroundColor: Color.fromARGB(255, 232, 130, 57), // Background color
        foregroundColor: Colors.white, // Text and icon color
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background
           Positioned(
            top: -15, 
            left: 0, 
            child: Image.asset(
              "assets/donation2.png",
              width: 400, 
              height: 400, 
              fit: BoxFit.cover,
            ),
          ),
          // Container 
          Positioned(
            top: 290, 
            left: -3, 
            child: Container(
              width: 400, 
              height: 450, 
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 229, 239, 95),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 70,
                        child : FloatingActionButton.extended(
                          onPressed: () async {
                            await Navigator.pushNamed(context, '/profileOrg');
                          },
                          backgroundColor: Color.fromARGB(255, 232, 130, 57), // Background color 
                          label: const Text('Go to Profile'),
                          icon: const Icon(Icons.account_circle),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 300,
                          height: 70,
                          child: FloatingActionButton.extended(
                          onPressed: () async {
                            await Navigator.pushNamed(context, '/donationListOrg');
                          },
                          backgroundColor: Color.fromARGB(255, 232, 130, 57),
                          label: const Text('See Donations'),
                          icon: const Icon(Icons.attach_money_rounded),
                        ),
                      ),                   
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 70,
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          backgroundColor: Color.fromARGB(255, 232, 130, 57),
                          label: const Text('Donation Drives'),
                          icon: const Icon(Icons.add_to_drive_outlined),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}