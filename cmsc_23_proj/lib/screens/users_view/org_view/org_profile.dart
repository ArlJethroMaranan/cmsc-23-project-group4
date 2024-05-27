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
        backgroundColor: Color.fromARGB(255, 232, 130, 57), // Background color
        foregroundColor: Colors.white, // Text and icon color
      ),
      backgroundColor: Color.fromARGB(255, 229, 239, 95),
      body: Center(
          child: Column(
              children: [
                const SizedBox(height: 30),
                ClipOval(
                  child: Container(
                    width:150,
                    height:150,
                    color: Color.fromARGB(255,232,130,57),
                    child: Center(
                      child: Image.asset(
                        'assets/donation2.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 390,
                  width: 370,
                  decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 232, 130, 57),
                  // borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: const Column (
                    children: [
                      SizedBox(height: 20),

                      Center(
                        child: Text("testemail@gmail.com", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Center(
                        child: Text("1827-364-9582"),
                      ),
                      SizedBox(height: 50),

                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Text('Organization Name:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ],
                            ),  
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Text('name'),
                              ],
                            ),  
                          ),
                          SizedBox(height: 30),

                          Padding(
                            padding: EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Text('About Organization:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ],
                            ),  
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Text('about'),
                              ],
                            ),  
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Text('Status for Donations:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ],
                            ),  
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Text('status'),
                              ],
                            ),  
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ],
          ),
      ),
    );
  }
}
