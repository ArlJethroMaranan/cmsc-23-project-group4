import 'package:cmsc_23_proj/screens/users_view/org_view/orgModel/driveOrgModel.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/orgProvider/providerDriveOrg.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/textfield.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/donoDriveImageUpload.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDonationDrive extends StatefulWidget {
  const AddDonationDrive({super.key});

  @override
  State<AddDonationDrive> createState() => _AddDonationDriveState();
}

class _AddDonationDriveState extends State<AddDonationDrive> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateAnswers() { //contains summary and checker if formkey is valid
    summaryText =
        'Name: ${nameController.text}\n'
        'Description: ${descriptionController.text}\n'
        'Photo: ${photoURL}\n';

    if (!formKey.currentState!.validate() || summaryText.contains('null')) {
      // if invalid
      showSummary = false;
    } else {
      // if valid
      setState(() {
        showSummary = true;
      });
      
      formKey.currentState!.save();
      {
              DonationDriveOrg temp = DonationDriveOrg(
                name: nameController.text,
                description: descriptionController.text,
                photo: photoURL,
                // photoController.text,
                //orgID: context.watch<>().userID(),
                orgID: 'En3NVkFvaL905dJ8ii8c'
              );

              context.read<DonationDriveOrgListProvider>().addDrive(temp);

              Navigator.of(context).pop();
      }

    }

  }

  //initialize some objects for storing values from classes
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  // TextEditingController photoController = TextEditingController();

  String? photoURL;
  String summaryText = '';
  bool showSummary = false;
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Color.fromARGB(255, 229, 239, 95),
    appBar: AppBar(
      title: const Text("ADD DONATION DRIVE"),
      backgroundColor: Color.fromARGB(255, 232, 130, 57), // Background color
      foregroundColor: Colors.white, // Text and icon color
    ),
    body: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Center(
          child: Column(
            children: [
              const Text( //show text for title 
                "What Donation Drive would you like to create?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          
              const SizedBox(height: 8),
          
              TextFieldState(
                hintText: "Enter the name of Drive.",
                label: "Name",
                controller: nameController,
                
              ), // textfield for name
          
              TextFieldState(
                hintText: "What is the Description for this Drive?",
                label: "Description",
                controller: descriptionController,
                
              ), //text field for desc

              ImageUpload((value) => photoURL=value),

              // TextFieldState(
              //   hintText: "Enter the photo for proof",
              //   label: "Photo",
              //   controller: photoController,
                
              // ), //text field for photo
          
              ElevatedButton( //click button to submit form
                onPressed: () {
                  setState(() {
                    validateAnswers(); //call validate answer to check if form is valid
                  });
                },
                child: const Text('Done'),
              ),
          
              // if (showSummary) //if valid from validateanswers print the summary
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Text(
              //         'SUMMARY',
              //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //       ),
              //       Text(
              //         summaryText,
              //         style: const TextStyle(fontSize: 18),
              //       ),
              //     ],
              //   )
              if (!showSummary && (nameController.text == "" || descriptionController.text == "" || photoURL == ''
              // || photoController.text == ""
              )) // else print invalid inputs
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'THERE ARE INVALID INPUTS',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
      
              ElevatedButton( // to reset all
                onPressed: () {
                  formKey.currentState!.reset(); //reset each from fields in each class
                },
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    ),
   );
  }
}