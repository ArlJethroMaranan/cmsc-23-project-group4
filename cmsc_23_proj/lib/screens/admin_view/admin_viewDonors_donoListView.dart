import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/models/models.dart';
import 'package:cmsc_23_proj/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonorsListView extends StatefulWidget {
  const DonorsListView({super.key});

  @override
  State<DonorsListView> createState() => _DonorsListViewState();
}

class _DonorsListViewState extends State<DonorsListView> {
  @override
  Widget build(BuildContext context) {
     Stream<QuerySnapshot> donorsStream = context.watch<DonorsListProvider>().donors;

    return StreamBuilder(
      stream: donorsStream,
      builder: (context, snapshot) { // snapshot cases 
        if (snapshot.hasError){
          return Center(child: Text("Error encountered! ${snapshot.error}"));
        } else if (snapshot.connectionState == ConnectionState.waiting){
          return Center (child: CircularProgressIndicator(),);
        } else if (!snapshot.hasData){
          return Center(child: Text("No Donations Found"));
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: ((context, index) {
            Donor temp = Donor.fromJson(snapshot.data!.docs[index].data() as Map<String,dynamic>);

            return Card(
              color: Color.fromARGB(255, 232, 139, 57),
              child: ExpansionTile(
                title: 
                  Text(temp.name),
                collapsedBackgroundColor: const Color.fromARGB(255, 232, 130, 57),
                backgroundColor: Colors.orangeAccent,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(temp.username)
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 229, 239, 95)
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute<Widget>(builder: (BuildContext context) {
                      return Expanded(child: donorDetails(temp)); }));
                    },
                    child: Text("More Info"),
                  ),
                ]
              )
            );
          })
        );
      }
    );    
  }

  Widget donorDetails(donor){
    return Scaffold(
      appBar: AppBar(title: Text(donor.name)),
      body: Container(
        padding: EdgeInsets.all(17),
        child: Column(
          children: [
            // const Text("Summary", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Text("Name: "),
                  Text("${donor.name}")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Text("Username: "),
                  Text("${donor.username}")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Text("Address 1: "),
                  Text("${donor.address1}")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Text("Contact Number: "),
                  Text("${donor.contactNum}")
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Back")
                )
              ]
            )
          ]
        ),
      )
    );
  }
}