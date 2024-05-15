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

  List<String> donationList = [
    "donation 1"
  ];


  Widget donationListView(){
    return ListView.builder(
      itemCount: donationList.length,
      itemBuilder: ((context, index) {
        return ExpansionTile(
          title: Text(donationList[index], 
            style: TextStyle(color: Colors.white),
          ),
          collapsedBackgroundColor: Color.fromARGB(255, 232, 139, 57),
          backgroundColor: Color.fromARGB(255, 232, 139, 57),
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text("donation details")
            )
          ]
        );
      })
    );
  }

  Widget orgListView(){
    return ListView.builder(
      itemCount: orgList.length,
      itemBuilder: ((context, index) {
        return Card(
          color: Color.fromARGB(255, 232, 139, 57),
          child: ExpansionTile(
            title: Text(orgList[index], 
              style: TextStyle(color: Colors.white),
            ),
            collapsedBackgroundColor: Color.fromARGB(255, 232, 139, 57),
            backgroundColor: Color.fromARGB(255, 232, 139, 57),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: donationListView()
              )
            ]
          )
        );  
      })
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View All Organizations and Donations"),
      ),
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
              Expanded(child: orgListView())
            ],
          ),
        )
      )
    );
  }

  
}