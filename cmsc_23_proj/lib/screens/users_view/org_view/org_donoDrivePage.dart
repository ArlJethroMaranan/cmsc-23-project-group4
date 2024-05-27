import 'package:cloud_firestore/cloud_firestore.dart';
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

    DonationDriveOrg donationDriveOrg = context.watch<DonationDriveOrgListProvider>().selectedDrive;

    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("DONATION DRIVE DETAILS"),
        backgroundColor: Color.fromARGB(255, 232, 130, 57), // Background color
        foregroundColor: Colors.white, // Text and icon color
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(donationDriveOrg.name!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


//       backgroundColor: const Color.fromARGB(255, 229, 239, 95),
//       body: StreamBuilder(
//         stream: donationOrgStream,
//         builder: (context, snapshot) { // snapshot cases 
//           if (snapshot.hasError){
//             return Center(child: Text("Error encountered! ${snapshot.error}"));
//           } else if (snapshot.connectionState == ConnectionState.waiting){
//             return Center (child: CircularProgressIndicator(),);
//           } else if (!snapshot.hasData){
//             return Center(child: Text("No Donations Found"));
//           }

//           DonationOrg temp = DonationOrg.fromJson(snapshot.data!.docs[index].data() as Map<String,dynamic>);

//           return Container(
//               // store to temp the data from snapshot
//               // DonationOrg temp = DonationOrg.fromJson(snapshot.data!.docs[index].data() as Map<String,dynamic>);

            
//           );
//         }
//       ),