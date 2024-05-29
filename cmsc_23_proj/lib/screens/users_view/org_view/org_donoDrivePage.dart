import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/EditDonationDrive.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/drawer.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/orgModel/driveOrgModel.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/orgProvider/providerDriveOrg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonoDriveDetails extends StatefulWidget {
  const DonoDriveDetails({super.key});

  @override
  State<DonoDriveDetails> createState() => _DonoDriveDetailsState();
}

class _DonoDriveDetailsState extends State<DonoDriveDetails> {
  @override
  Widget build(BuildContext context) {

    DonationDriveOrg donationDriveOrg = context.watch<DonationDriveOrgListProvider>().selectedDrive; // since we changed the selected drive to the drive the user has chosen before going to this page, we can now access the specific details by watching the selected drive

    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("DONATION DRIVE DETAILS"),
        backgroundColor: Color.fromARGB(255, 232, 130, 57), // Background color
        foregroundColor: Colors.white, // Text and icon color
      ),
      backgroundColor: const Color.fromARGB(255, 229, 239, 95),
      body: Padding(
              padding: const EdgeInsets.all(16),
              child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                      child: Text(donationDriveOrg.name!, style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                    ),

                    const SizedBox(height: 15,),
                    
                    Text(donationDriveOrg.description!, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),

                    const SizedBox(height: 15,),

                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 214, 126, 62),
                          borderRadius: BorderRadius.circular(50), 
                        ),
                        clipBehavior: Clip.antiAlias, // clip overflow of image of the container
                        child: Image.asset(
                                'assets/donation2.png',
                              ),
                      ),
                    ),

                    const SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await context.read<DonationDriveOrgListProvider>().deleteDrive(donationDriveOrg.id!);
                                print("deleted");
                                Navigator.pop(context);
                          
                              }
                              , child: const Text('Delete Drive')
                            ),
                          ],
                        ),

                        const SizedBox(width: 15,),

                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditDonationDrive(drive : donationDriveOrg))); // pass the donationDriveOrg to edit donation since we need the id for editing
                              }, 
                              child: const Text('Edit Drive'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
            ),
        );
  }
}
