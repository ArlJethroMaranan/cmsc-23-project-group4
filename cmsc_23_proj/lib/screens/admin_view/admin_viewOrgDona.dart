import 'package:cmsc_23_proj/screens/admin_view/admin_ViewOrgDona_Donation.dart';
import 'package:cmsc_23_proj/screens/admin_view/admin_ViewOrgDona_Organization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewOrgsDonaPage extends StatefulWidget {
  const ViewOrgsDonaPage({super.key});

  @override
  State<ViewOrgsDonaPage> createState() => _ViewOrgsDonaPageState();
}

class _ViewOrgsDonaPageState extends State<ViewOrgsDonaPage> {
  List<String> orgList = [
    "Seventeen",
    "EXO"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View All Organizations and Donations"),
      ),
      body: Container(
        margin: const EdgeInsets.all(18),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Organizations",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Expanded(child: OrganizationListView())
            ],
          ),
        )
      )
    );
  }

  
}