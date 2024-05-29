import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/models/models.dart';
import 'package:cmsc_23_proj/provider/provider.dart';
import 'package:cmsc_23_proj/screens/admin_view/admin_ViewOrgDona_Donation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganizationListView extends StatefulWidget {
  const OrganizationListView({super.key});

  @override
  State<OrganizationListView> createState() => _OrganizationListViewState();
}

class _OrganizationListViewState extends State<OrganizationListView> {
  @override
  Widget build(BuildContext context) {
    
    Stream<QuerySnapshot> organizationStream = context.watch<OrganizationsListProvider>().organization;

    return StreamBuilder(
        stream: organizationStream,
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
              Organization temp = Organization.fromJson(snapshot.data!.docs[index].data() as Map<String,dynamic>);

              return Card(
                color: Color.fromARGB(255, 232, 139, 57),
                child: ExpansionTile(
                  title: Row(children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width / 7,
                    height: MediaQuery.of(context).size.width / 7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300.0),
                      child: Image.asset('./assets/orgLogo1.jpg', fit: BoxFit.cover,),
                    ),
                  ),
                  Text(temp.name, style: const TextStyle(color: Colors.white),),
                ],),
                  collapsedBackgroundColor: Color.fromARGB(255, 232, 139, 57),
                  backgroundColor: Colors.orangeAccent,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(temp.about)),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(temp.status)
                            ),
                            SizedBox(
                              height: 220,
                              child: DonationListView()
                            )
                          ],
                        ),
                    )
                  ]
                )
              );  
            })
          );
        }
      );
  }
}