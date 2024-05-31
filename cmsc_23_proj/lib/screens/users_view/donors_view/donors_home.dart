import 'package:cmsc_23_proj/screens/users_view/donors_view/drawers2.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DonorHome extends StatefulWidget {
  const DonorHome({super.key});

  @override
  State<DonorHome> createState() => _DonorHomeState();
}

class _DonorHomeState extends State<DonorHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer2Widget(),
      appBar: AppBar(
        title: const Text("DONATION"),
        backgroundColor: Color.fromARGB(255, 232, 130, 57), // Background color
        foregroundColor: Colors.white, // Text and icon color
      ),
      body: Column(
        children: [
           Image.asset(
              "assets/donation2.png",
              width: 400, 
              height: 250, 
              fit: BoxFit.cover,
            ),
          Flexible(
            child: Container(
              // width: 400, 
              height: 500, 
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 229, 239, 95),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
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
                            await Navigator.pushNamed(context, '/donors-profile');
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
                            await Navigator.pushNamed(context, '/donors-org');
                          },
                          backgroundColor: Color.fromARGB(255, 232, 130, 57),
                          label: const Text('See organizations'),
                          icon: const Icon(Icons.attach_money_rounded),
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