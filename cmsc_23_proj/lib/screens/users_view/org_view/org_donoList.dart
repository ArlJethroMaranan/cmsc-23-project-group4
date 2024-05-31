import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/drawer.dart';
import 'package:cmsc_23_proj/models/donation_model.dart';
import 'package:cmsc_23_proj/provider/donation_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonationList extends StatefulWidget {
  const DonationList({super.key});

  @override
  State<DonationList> createState() => _DonationListState();
}

List<String> donoStatus = [
  'Pending',
  'Confirmed',
  'Scheduled for pickup',
  'Complete',
  'Canceled'
]; // initialize donostatus

class _DonationListState extends State<DonationList> {
  // final List<Map<String, dynamic>> donations = [ // list that holds the data to be inserted to expansion tile
  //   {
  //     "title": "Help Jonathan Joestar finish his house.",
  //     "amount": 2500,
  //     "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc et aliquet lectus, id ornare ligula. Aenean sit amet tempor ipsum. Vestibulum maximus egestas leo sed fermentum. Mauris vel sapien placerat enim viverra euismod. Ut eu elementum mi. Integer euismod ipsum id pellentesque ornare. Nullam ac tellus interdum urna placerat bibendum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt justo nec eros convallis gravida. Sed at magna eu sem efficitur tempor in ac metus. Aliquam bibendum, neque dictum efficitur lacinia, nulla nisi euismod tellus, a malesuada sapien nisl non est. Nam placerat dolor sapien, ac tempor neque facilisis id.",
  //     "status": donoStatus[0] // set default status to pending
  //   },
  //   {"title": "Dummy name 2", "amount": 2500, "description": "description", "status": donoStatus[0]},
  //   {"title": "Dummy name 3", "amount": 2500, "description": "description", "status": donoStatus[0]},
  //   {"title": "Dummy name 4", "amount": 2500, "description": "description", "status": donoStatus[0]},
  // ];

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> donationOrgStream =
        context.watch<DonationOrgListProvider>().donationOrg;

    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("DONATION LIST"),
        backgroundColor: const Color.fromARGB(255, 232, 130, 57),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 229, 239, 95),
      body: StreamBuilder(
          stream: donationOrgStream,
          builder: (context, snapshot) {
            // snapshot cases
            if (snapshot.hasError) {
              return Center(
                  child: Text("Error encountered! ${snapshot.error}"));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return Center(child: Text("No Donations Found"));
            }
            return ListView.builder(
              itemCount:
                  snapshot.data!.docs.length, //length based on donation list
              itemBuilder: (context, index) {
                // store to temp the data from snapshot
                DonationModel temp = DonationModel.fromJson(
                    snapshot.data!.docs[index].data() as Map<String, dynamic>);

                // final donation = donations[index];
                return Card(
                  // Wrapped expansion tile with Card
                  color: const Color.fromARGB(255, 214, 126, 62),
                  child: ExpansionTile(
                    backgroundColor: const Color.fromARGB(255, 219, 110, 32),
                    title: Text(
                      "address1 : ${temp.address1!}", // name
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // subtitle: Text(
                    //   "Current Amount Raised: ${donation["amount"]}", // amount
                    //   style: const TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 16,
                    //   ),
                    // ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          "address1 : ${temp.address1!}", // description
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          "address2 : ${temp.address2!}", // description
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'contact : ${temp.contactNum}', // description
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'donation type : ${temp.donationType!}', // description
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          temp.photo!, // description
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'TypeOfService : ${temp.receiveType! ? "Pickup" : "drop-off"}', // description
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'TimeforService : ', // description
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          DateTime.fromMicrosecondsSinceEpoch(
                                  temp.schedule!.microsecondsSinceEpoch)
                              .toString(), // description
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'WeightOfDonation : ${temp.weight}', // description
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(16),
                      //   child: Image.asset(
                      //     "assets/donation2.png",
                      //     width: 400,
                      //     height: 250,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      //Created Radios for the donation status
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Donation Status", // description
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Column(
                        children: donoStatus.map((status) {
                          // convert each donostatus string to a list tile (used .map to access each individual strings in the donostatus list)
                          return ListTile(
                            // use list tile to add leading with radio
                            title: Text(
                              status,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            leading: Radio<String>(
                              value: status,
                              groupValue:
                                  temp.status, // points to currently picked
                              onChanged: (value) {
                                setState(() {
                                  temp.status = value!; // change the value
                                  // FirebaseFirestore.instance.collection('donations').doc(snapshot.data!.docs[index].id).update({'status': value}); // access the instance of the donations document using it's id then updating the status with the new value

                                  DonationModel data = DonationModel(
                                    // access status to a variable data from model
                                    status: temp.status,
                                  );

                                  context
                                      .read<DonationOrgListProvider>()
                                      .editStatus(snapshot.data!.docs[index].id,
                                          data); // call edit status to change the status
                                });
                              },
                            ),
                          );
                        }).toList(), // convert toList since column can't accept iterable
                      ),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
