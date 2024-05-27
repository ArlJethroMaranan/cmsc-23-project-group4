import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/drawer.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/orgModel/driveOrgModel.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/orgProvider/providerDriveOrg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonationDrive extends StatefulWidget {
  const DonationDrive({super.key});

  @override
  State<DonationDrive> createState() => _DonationDriveState();
}

class _DonationDriveState extends State<DonationDrive> {
  @override
  Widget build(BuildContext context) {
    
    Stream<QuerySnapshot> donationDriveOrgStream = context.watch<DonationDriveOrgListProvider>().donationDriveOrg;
    
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("DONATION DRIVE"),
        backgroundColor: Color.fromARGB(255, 232, 130, 57), // Background color
        foregroundColor: Colors.white, // Text and icon color
      ),
      backgroundColor: const Color.fromARGB(255, 229, 239, 95),
      body: 
      StreamBuilder(
        stream: donationDriveOrgStream,
        builder: (context, snapshot) { // snapshot cases 
          if (snapshot.hasError){
            return Center(child: Text("Error encountered! ${snapshot.error}"));
          } else if (snapshot.connectionState == ConnectionState.waiting){
            return Center (child: CircularProgressIndicator(),);
          } else if (!snapshot.hasData){
            return Center(child: Text("No Donations Found"));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length, // length based on donation list
            itemBuilder: (context, index) {
              // store to temp the data from snapshot
              DonationDriveOrg temp = DonationDriveOrg.fromJson(snapshot.data!.docs[index].data() as Map<String, dynamic>);

              // final donation = donations[index];
              return Padding(
                padding: const EdgeInsets.all(10), // Add space for each item
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 214, 126, 62),
                    borderRadius: BorderRadius.circular(16), 
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [

                        const SizedBox(width: 10),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              ClipOval(
                              child: Container(
                                width:60,
                                height:60,
                                color: Color.fromARGB(255,232,130,57),
                                child: Center(
                                  child: Image.asset(
                                    'assets/donation2.png',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${temp.name}",style: const TextStyle(fontSize: 20)),
                              // Text("${temp.description}")
                              Text(temp.description!.length>15 ? temp.description!.substring(0,15): "${temp.description}", style: const TextStyle(fontSize: 20)), // make sure that it shows only up to 15 length so that it does not overflow
                            ],
                          ),
                        ),

                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 70,
                                child: FloatingActionButton.extended(
                                        onPressed: () async {
                                          context.read<DonationDriveOrgListProvider>().updateSelectedDrive(temp); // pass donation drive(temp) to update selected drive
                                          await Navigator.pushNamed(context, '/driveOrgDet');
                                        },
                                        backgroundColor: const Color.fromARGB(255, 229, 239, 95), // Background color 
                                        label: const Text(''),
                                        icon: const Icon(Icons.check),
                                        ),
                                      ),
                            ], 
                        ),
                        
                      ],
                    ),
                  ),
                ),
              );
              // donation drive name
              // donation photo
              // donation description
              // donation button na pag clinick mapupunta sa org dono drive
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/driveOrgAdd');
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
    );
  }
}