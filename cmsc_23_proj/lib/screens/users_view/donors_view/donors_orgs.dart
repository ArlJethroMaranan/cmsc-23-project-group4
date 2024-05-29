import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/screens/users_view/donors_view/donorsModel/organizationsModel.dart';
import 'package:cmsc_23_proj/screens/users_view/donors_view/donorsProvider/providerOrg.dart';
import 'package:cmsc_23_proj/screens/users_view/donors_view/donors_donate.dart';
import 'package:cmsc_23_proj/screens/users_view/donors_view/drawers2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonorsOrgs extends StatefulWidget {
  const DonorsOrgs({super.key});

  @override
  State<DonorsOrgs> createState() => _DonorsOrgsState();
}

class _DonorsOrgsState extends State<DonorsOrgs> {
  

  @override
  Widget build(BuildContext context) {

    Stream<QuerySnapshot> orgStream = context.watch<OrgsListProvider>().orgs;

  
    return Scaffold(
      drawer: const Drawer2Widget(),
      appBar: AppBar(
        title: const Text("ORGANIZATION LISTS"),
        backgroundColor: const Color.fromARGB(255, 232, 130, 57),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 229, 239, 95),
      body: StreamBuilder(
        stream: orgStream,
        builder: (context, snapshot) { // snapshot cases 
          if (snapshot.hasError){
            return Center(child: Text("Error encountered! ${snapshot.error}"));
          } else if (snapshot.connectionState == ConnectionState.waiting){
            return Center (child: CircularProgressIndicator(),);
          } else if (!snapshot.hasData){
            return Center(child: Text("No Donations Found"));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length, //length based on donation list
            itemBuilder: (context, index) {

              // store to temp the data from snapshot
              OrgModel temp = OrgModel.fromJson(snapshot.data!.docs[index].data() as Map<String,dynamic>);

              Widget canDonateButton = temp.status == "Open"? ElevatedButton(onPressed: () async{await Navigator.push(context,MaterialPageRoute(builder: (context) => DonorsDonate(orgID: temp.orgID!)));}, child: Text('Donate')):SizedBox.shrink(); // if the status is open then the elevated button will show so that users can donate
              // final donation = donations[index];
              return Card( // Wrapped expansion tile with Card
                color: const Color.fromARGB(255, 214, 126, 62),
                child: ExpansionTile(
                  backgroundColor: const Color.fromARGB(255, 219, 110, 32),
                  title: Text(
                    temp.name!, // name
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "about : ${temp.about!}", // description
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "name : ${temp.name!}", // description
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'photo : ${temp.photo}', // description
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'status : ${temp.status}', // description
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: canDonateButton, // call can donate button from widget above
                    ),
                  ],
                ),
              );
            },
          );
        }
      ),
    );
  }  

}