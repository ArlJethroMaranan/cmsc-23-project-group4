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

  Widget orgListView(){
    return ListView.builder(
      itemCount: orgList.length,
      itemBuilder: ((context, index) {
        return ListTile(
          title: Text(orgList[index]),
          tileColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white),
          // onTap: ,
        );
      })
    );
  }

  Widget donationListView(){
    return ListView.builder(
      itemCount: donationList.length,
      itemBuilder: ((context, index) {
        return ListTile(
          title: Text(donationList[index]),
          tileColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white),
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