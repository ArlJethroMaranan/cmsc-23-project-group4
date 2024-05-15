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
      body: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/ViewOrgsDonaPage');
            }, 
            child: const Text("View All Organizations and Donations")
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/OrgApprovalPage');
            }, 
            child: const Text("Organization Approval Page")
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/ViewOrgsDonaPage');
            }, 
            child: const Text("View All Donors")
          )
        ],
      )
    );
  }
}