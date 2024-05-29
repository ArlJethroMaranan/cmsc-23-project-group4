import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/drawer.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/orgModel/profileOrg.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/orgProvider/providerProfileOrg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileOrg extends StatefulWidget {
  const ProfileOrg({super.key});

  @override
  State<ProfileOrg> createState() => _ProfileOrgState();
}

List<String> statusForDono = ['Open','Close'];

class _ProfileOrgState extends State<ProfileOrg> {
  @override
  Widget build(BuildContext context) {

    Stream<QuerySnapshot> profileOrgStream = context.watch<OrgProfileProvider>().profileOrg;

    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("PROFILE"),
        backgroundColor: Color.fromARGB(255, 232, 130, 57), // Background color
        foregroundColor: Colors.white, // Text and icon color
      ),
      backgroundColor: Color.fromARGB(255, 229, 239, 95),
      body: StreamBuilder(
        stream: profileOrgStream,
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
        
        ProfileModelOrg temp = ProfileModelOrg.fromJson(snapshot.data!.docs[index].data() as Map<String, dynamic>);
      
      return Center(
          child: Column(
              children: [
                const SizedBox(height: 30),
                ClipOval(
                  child: Container(
                    width:150,
                    height:150,
                    color: Color.fromARGB(255,232,130,57),
                    child: Center(
                      child: Image.asset(
                        'assets/donation2.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 430,
                  width: 370,
                  decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 232, 130, 57),
                  // borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Column (
                    children: [
                      const SizedBox(height: 20),

                      const Center(
                        child: Text("testemail@gmail.com", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      const Center(
                        child: Text("1827-364-9582"),
                      ),
                      const SizedBox(height: 50),

                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Text('Organization Name:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ],
                            ),  
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Text("${temp.name}"),
                              ],
                            ),  
                          ),
                          const SizedBox(height: 30),

                          const Padding(
                            padding: EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Text('About Organization:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ],
                            ),  
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Text('${temp.about}'),
                              ],
                            ),  
                          ),
                          const SizedBox(height: 30),
                          const Padding(
                            padding: EdgeInsets.only(left:20),
                            child: Row(
                              children: [
                                Text('Status for Donations:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              ],
                            ),  
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(left:20),
                          //   child: Row(
                          //     children: [
                          //       Text('status'),
                          //     ],
                          //   ),  
                          // ),

                          Column(
                            children: statusForDono.map((status) { // convert each donostatus string to a list tile (used .map to access each individual strings in the donostatus list)
                              return ListTile( // use list tile to add leading with radio
                                title: Text(
                                  status,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                leading: Radio<String>(
                                  value: status,
                                  groupValue: temp.status, // points to currently picked
                                  onChanged: (value) {
                                    setState(() {
                                      temp.status = value!; // change the value 
                                      // FirebaseFirestore.instance.collection('donations').doc(snapshot.data!.docs[index].id).update({'status': value}); // access the instance of the donations document using it's id then updating the status with the new value
                                      
                                      ProfileModelOrg data = ProfileModelOrg( // access status to a variable data from model
                                        status: temp.status,
                                      );
                                      
                                      context.read<OrgProfileProvider>().editStatus(snapshot.data!.docs[index].id, data); // call edit status to change the status
                                    });
                                  },
                                ),
                              );
                            }).toList(), // convert toList since column can't accept iterable 
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ],
          ),
        );
        }
      );
     
        }
      ),
    );
  }
}
