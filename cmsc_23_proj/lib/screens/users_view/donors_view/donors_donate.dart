import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/models/donation_model.dart';
import 'package:cmsc_23_proj/models/org_profile_model.dart';
import 'package:cmsc_23_proj/provider/donation_list_provider.dart';
import 'package:cmsc_23_proj/provider/org_profile_provider.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonorsDonate extends StatefulWidget {
  const DonorsDonate({super.key, required this.orgID});

  final String orgID;

  @override
  State<DonorsDonate> createState() => _DonorsDonateState();
}

List<String> typeOfDono = ['Food', 'Clothes', 'Cash', 'Necessities'];

class _DonorsDonateState extends State<DonorsDonate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAnswers() {
    //contains summary and checker if formkey is valid
    summaryText = '1st Address: ${address1Controller.text}\n'
        '2nd Address: ${address2Controller.text}\n'
        'Contact Number: ${contactNumController.text}\n'
        'Photo: ${photoController.text}\n'
        'Weight: ${weightController.text}\n';

    if (!_formKey.currentState!.validate() ||
        summaryText.contains('null') ||
        int.tryParse(weightController.text) == null ||
        int.tryParse(contactNumController.text) == null) {
      // if invalid
      showSummary = false;
    } else {
      // if valid
      setState(() {
        showSummary = true;
      });

      _formKey.currentState!.save();
      {
        DonationModel temp = DonationModel(
          address1: address1Controller.text,
          address2: address2Controller.text,
          contactNum: int.parse(contactNumController.text),
          photo: photoController.text,
          weight: int.parse(weightController.text),
          donationType: "", // dapat radio
          receiveType: true, // dapat slide
          schedule: null, // timestamp dapat
          orgID: widget.orgID,
        );

        context.read<DonationOrgListProvider>().addDonation(temp);
      }
    }
  }

  //initialize some objects for storing values from classes
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController contactNumController = TextEditingController();
  TextEditingController photoController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  //status
  //donationType (checkbox)
  //receivetype (slide)
  // schedule (iba data type)

  String summaryText = '';
  bool showSummary = false;
  // bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {

    Stream<QuerySnapshot> donationOrgStream = context.watch<DonationOrgListProvider>().donationOrg;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 239, 95),
      appBar: AppBar(
        title: const Text("ADD DONATION"),
        backgroundColor: Color.fromARGB(255, 232, 130, 57), // Background color
        foregroundColor: Colors.white, // Text and icon color
      ),
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
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        //show text for title
                        "What Donation would you like to give?",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
            
                      const SizedBox(height: 8),
            
                      TextFieldState(
                        hintText: "Enter your first address.",
                        label: "Address",
                        controller: address1Controller,
                      ), // textfield for name
            
                      TextFieldState(
                        hintText: "Enter your second address.",
                        label: "Address",
                        controller: address2Controller,
                      ), // textfield for name
            
                      TextFieldState(
                        hintText: "Enter your contact number.",
                        label: "number",
                        controller: contactNumController,
                      ), // textfield for name
            
                      TextFieldState(
                        hintText: "Enter the photo of the object to donate.",
                        label: "donation image",
                        controller: photoController,
                      ), // textfield for name
            
                      TextFieldState(
                        hintText: "Enter the weight of the object to donate.",
                        label: "weight",
                        controller: weightController,
                      ), // textfield for name
  
                      Column(
                        children: typeOfDono.map((item) {
                          // convert each donostatus string to a list tile (used .map to access each individual strings in the donostatus list)
                          return ListTile(
                            // use list tile to add leading with radio
                            title: Text(
                              item,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            leading: Radio<String>(
                              value: item,
                              groupValue: temp.donationType, // points to currently picked
                              onChanged: (value) {
                                setState(() {
                                  temp.donationType = value!; // change the value
                                  // FirebaseFirestore.instance.collection('donations').doc(snapshot.data!.docs[index].id).update({'status': value}); // access the instance of the donations document using it's id then updating the status with the new value
            
                                  DonationModel data = DonationModel(
                                    // access status to a variable data from model
                                    donationType: temp.donationType,
                                  );
            
                                  context.read<DonationOrgListProvider>().editDonationType(snapshot.data!.docs[index].id,data); // call edit status to change the status
                                });
                              },
                            ),
                          );
                        }).toList(), // convert toList since column can't accept iterable
                      ),
            
                      ElevatedButton(
                        //click button to submit form
                        onPressed: () {
                          setState(() {
                            validateAnswers(); //call validate answer to check if form is valid
                          });
                        },
                        child: const Text('Done'),
                      ),
            
                      if (showSummary) //if valid from validateanswers print the summary
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'SUMMARY',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              summaryText,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        )
                      else if (!showSummary ||
                          (address1Controller.text == "" ||
                              address2Controller.text == "" ||
                              photoController.text == "" ||
                              contactNumController.text == "" ||
                              weightController.text ==
                                  "")) // else print invalid inputs
                        const Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'THERE ARE INVALID INPUTS \n (Make sure Number and Weight are numbers)',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
            
                      ElevatedButton(
                        // to reset all
                        onPressed: () {
                          _formKey.currentState!
                              .reset(); //reset each from fields in each class
                          address1Controller.clear();
                          address2Controller.clear();
                          contactNumController.clear();
                          photoController.clear();
                          weightController.clear();
                        },
                        child: const Text('Reset'),
                      ),
            
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Return')),
                    ],
                  ),
                ),
              ),
            );
          });
            
          },
      ),
    );
  }
}
