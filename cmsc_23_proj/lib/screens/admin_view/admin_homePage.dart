import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Home Page"),
        backgroundColor: const Color.fromARGB(255, 232, 130, 57),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 229, 239, 95),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Welcome Admin!", 
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
                ),
              ),
            // Card(
            //   shape: Sha,
            //   child: Container(
            //     child: Column(
            //       children: [
            //         Icon(Icons.groups),
            //         TextButton(
            //           onPressed: (){
            //             Navigator.pushNamed(context, '/ViewOrgsDonaPage');
            //           },
            //           child: const Text("View All Organizations and Donations")
            //         )
            //       ],
            //       )
            //     ),
            //   ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/ViewOrgsDonaPage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 232, 139, 57),
                foregroundColor: Colors.white
              ),
              child: const Text("View All Organizations and Donations")
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/OrgApprovalPage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 232, 139, 57),
                foregroundColor: Colors.white
              ),
              child: const Text("Organization Approval Page")
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/ViewDonorsPage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 232, 139, 57),
                foregroundColor: Colors.white
              ),
              child: const Text("View All Donors")
            )
          ],
        ),
      )
      
    );
  }
}