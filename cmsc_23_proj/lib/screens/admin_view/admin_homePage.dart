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
      ),
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
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/ViewOrgsDonaPage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white
              ),
              child: const Text("View All Organizations and Donations")
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/OrgApprovalPage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white
              ),
              child: const Text("Organization Approval Page")
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/ViewDonorsPage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
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