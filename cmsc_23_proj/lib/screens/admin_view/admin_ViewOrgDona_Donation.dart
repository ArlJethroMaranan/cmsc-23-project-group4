import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cmsc_23_proj/models/models.dart';

class DonationListView extends StatefulWidget {
  const DonationListView({super.key});

  @override
  State<DonationListView> createState() => _DonationListViewState();
}

class _DonationListViewState extends State<DonationListView> {
  @override
  Widget build(BuildContext context) {

    Stream<QuerySnapshot> donationStream = context.watch<DonationListProvider>().donation;

    return StreamBuilder(
        stream: donationStream,
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
              bool forPickup = false;
              Donation temp = Donation.fromJson(snapshot.data!.docs[index].data() as Map<String,dynamic>);

              if(temp.deliveryType == "pickup"){
                forPickup = true;
              }

              return ListTile(
                title: Text("Donation"),
                titleTextStyle: TextStyle(color: Colors.white),
                subtitle: Text(temp.status),
                trailing: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 229, 239, 95)
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute<Widget>(builder: (BuildContext context) {
                      return Expanded(child: donationDetails(temp, forPickup)); }));
                  },
                  child: Text("More Info"),
                ),
              );
            })
          );
        }
      );
  }

  Widget donationDetails(donation, forPickup){
    return Scaffold(
      appBar: AppBar(title: Text("Donation")),
      body: Container(
        padding: EdgeInsets.all(17),
        child: Column(
          children: [
            // const Text("Summary", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Text("Status: "),
                  Text("${donation.status}")
                ],
              ),
            ),
            Column(
              children: [
                  Row(
                    children: [ 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Text("Category: "),
                                Text("${donation.donationType}")
                              ],
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Text("Weight: "),
                                Text("${donation.weight}")
                              ],
                            )
                          ),
                        ],
                      ),
                      Image(
                        image: AssetImage("./assets/donation.png"),
                        height: 100,
                        width: 100,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Text("Delivery Type: "),
                        Text("${donation.deliveryType}")
                      ],
                    ),
                  ), 
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Text("Date & Time for ${donation.deliveryType}: "),
                        Text(" ")
                      ],
                    ),
                  ),
                  Offstage(
                    offstage: !forPickup,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16), 
                          child: Row(
                            children: [
                              const Text("Address 1: "),
                              Text("${donation.address1}")
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16), 
                          child: Row(
                            children: [
                              const Text("Address 2: "),
                              Text("${donation.address2}")
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Text("Contact Number: "),
                              Text("${donation.contactNum}")
                            ],
                          ),
                        ),
                      ],
                    )
                  )
                ],
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