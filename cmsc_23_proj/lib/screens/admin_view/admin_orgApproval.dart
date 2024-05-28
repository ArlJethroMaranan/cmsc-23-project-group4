import 'package:cmsc_23_proj/screens/admin_view/admin_orgApproval_orgListView.dart';
import 'package:flutter/material.dart';

class OrgApprovalPage extends StatefulWidget {
  const OrgApprovalPage({super.key});

  @override
  State<OrgApprovalPage> createState() => _OrgApprovalPageState();
}

class _OrgApprovalPageState extends State<OrgApprovalPage> {
  // List<String> orgList = [
  //   "Going Rangers"
  // ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Organizations for Approval"),
        backgroundColor: const Color.fromARGB(255, 232, 130, 57),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 229, 239, 95),
      body: Container(
        margin: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Organizations",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Expanded(child: OrgForApprovalListView())
            ],
          ),
        )
      )
    );
  }
}