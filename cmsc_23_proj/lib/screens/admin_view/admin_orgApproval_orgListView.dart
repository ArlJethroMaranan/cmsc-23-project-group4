import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/models/models.dart';
import 'package:cmsc_23_proj/provider/provider.dart';
import 'package:cmsc_23_proj/screens/imageConversion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrgForApprovalListView extends StatefulWidget {
  const OrgForApprovalListView({super.key});

  @override
  State<OrgForApprovalListView> createState() => _OrgForApprovalListViewState();
}

class _OrgForApprovalListViewState extends State<OrgForApprovalListView> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> orgsForApprovalStream = context.watch<OrgsForApprovalListProvider>().orgsForApproval;

    return StreamBuilder(
        stream: orgsForApprovalStream,
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
              OrgForApproval temp = OrgForApproval.fromJson(snapshot.data!.docs[index].data() as Map<String,dynamic>);

              temp.id = snapshot.data?.docs[index].id;

              return Card(
                color: Color.fromARGB(255, 232, 139, 57),
                child: ExpansionTile(
                  title: Text(temp.name),
                  backgroundColor: Colors.orangeAccent,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(temp.about),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 229, 239, 95)
                          ),
                          onPressed: () async {
                            Stream<QuerySnapshot> orgList = context.read<OrganizationsListProvider>().organization;
                            
                            Organization approvedOrg = Organization(
                              orgID: temp.id!,
                              name: temp.name, 
                              about: temp.about,
                              status: "closed",
                              photo: convertedPhoto
                            );

                            context.read<OrganizationsListProvider>().addOrganization(approvedOrg);
                            
                            showDialog<String>(
                              context: context, 
                              builder: (BuildContext context) => (
                                Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Organization: ${temp.name} approved!"),
                                        TextButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          }, child: const Text('Close'),
                                        )
                                      ],
                                    )
                                  )
                                )
                              )
                            );
                            
                            context.read<OrgsForApprovalListProvider>().deleteOrgForApproval(temp.id!);
                          },
                          child: Text("Approve"),
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 229, 239, 95)
                          ),
                          onPressed: (){
                            showDialog<String>(
                              context: context, 
                              builder: (BuildContext context) => (
                                Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Organization: ${temp.name} disapproved!"),
                                        TextButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          }, child: const Text('Close'),
                                        )
                                      ],
                                    )
                                  )
                                )
                              )
                            );

                            context.read<OrgsForApprovalListProvider>().deleteOrgForApproval(temp.id!);
                          },
                          child: Text("Disapprove"),
                        ),
                      ],
                    ),
                    OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 229, 239, 95)
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute<Widget>(builder: (BuildContext context) {
                              return Expanded(child: orgDetails(temp)); }));
                          },
                          child: Text("More Info"),
                        ),
                  ],
                )
              );
            })
          );
        }
    );
  }

  Widget orgDetails(organization){
    return Scaffold(
      appBar: AppBar(
        title: Text("${organization.name}"),
        backgroundColor: const Color.fromARGB(255, 232, 130, 57),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 229, 239, 95),
      body: Container(
        padding: EdgeInsets.all(17),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Text("About: "),
                  Text("${organization.about}")
                ],
              )
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("Proofs of Legitimacy"), //can do gridbuilder to show pics
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Approve")
                ),
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