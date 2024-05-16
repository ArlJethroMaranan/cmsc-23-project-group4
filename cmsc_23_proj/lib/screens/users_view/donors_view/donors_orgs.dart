import 'package:flutter/material.dart';

class DonorsOrgs extends StatefulWidget {
  const DonorsOrgs({super.key});

  @override
  State<DonorsOrgs> createState() => _DonorsOrgsState();
}

class _DonorsOrgsState extends State<DonorsOrgs> {
  List orgs = [
    'Org1',
    'Org2',
    'Org3',
    'Org4',
    'Org5',
    'Org6',
    'Org7',
    'Org8',
    'Org9',
    'Org10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Donors")),
      body: ListView.builder(
        itemCount: orgs.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.fromLTRB(10,0,10,0),
            child: Card(
              child: ListTile(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                leading: const Icon(Icons.person),
                title: Text(
                  orgs[index],
                  style: const TextStyle(fontWeight: FontWeight.bold)
                ),
                onTap: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}