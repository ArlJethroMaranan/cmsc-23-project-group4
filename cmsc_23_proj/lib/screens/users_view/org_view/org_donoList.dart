import 'package:cmsc_23_proj/screens/users_view/org_view/drawer.dart';
import 'package:flutter/material.dart';

class DonationList extends StatefulWidget {
  const DonationList({super.key});

  @override
  State<DonationList> createState() => _DonationListState();
}

List<String> donoStatus = ['Pending','Confirmed','Scheduled for pickup','Complete','Canceled']; // initialize donostatus 

class _DonationListState extends State<DonationList> {

  final List<Map<String, dynamic>> donations = [ // list that holds the data to be inserted to expansion tile
    {
      "title": "Help Jonathan Joestar finish his house.",
      "amount": 2500, 
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc et aliquet lectus, id ornare ligula. Aenean sit amet tempor ipsum. Vestibulum maximus egestas leo sed fermentum. Mauris vel sapien placerat enim viverra euismod. Ut eu elementum mi. Integer euismod ipsum id pellentesque ornare. Nullam ac tellus interdum urna placerat bibendum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt justo nec eros convallis gravida. Sed at magna eu sem efficitur tempor in ac metus. Aliquam bibendum, neque dictum efficitur lacinia, nulla nisi euismod tellus, a malesuada sapien nisl non est. Nam placerat dolor sapien, ac tempor neque facilisis id.",
      "status": donoStatus[0] // set default status to pending
    },
    {"title": "Dummy name 2", "amount": 2500, "description": "description", "status": donoStatus[0]},
    {"title": "Dummy name 3", "amount": 2500, "description": "description", "status": donoStatus[0]},
    {"title": "Dummy name 4", "amount": 2500, "description": "description", "status": donoStatus[0]},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("DONATION LIST"),
        backgroundColor: const Color.fromARGB(255, 232, 130, 57),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 229, 239, 95),
      body: ListView.builder(
        itemCount: donations.length, //length based on donation list
        itemBuilder: (context, index) {
          final donation = donations[index];
          return Card( // Wrapped expansion tile with Card
            color: const Color.fromARGB(255, 214, 126, 62),
            child: ExpansionTile(
              backgroundColor: const Color.fromARGB(255, 219, 110, 32),
              title: Text(
                donation["title"], // name
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Current Amount Raised: ${donation["amount"]}", // amount
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    donation["description"], // description
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    "assets/donation2.png",
                    width: 400, 
                    height: 250, 
                    fit: BoxFit.cover,
                  ),
                ),
                // Created Radios for the donation status
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
                  children: donoStatus.map((status) => ListTile( // convert each string status in donoStatus to list tile
                    title: Text(
                      status,
                      style: const TextStyle( 
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    leading: Radio<String>(
                      value: status,
                      groupValue: donation["status"], // points to currently picked
                      onChanged: (value) {
                        setState(() {
                          donation["status"] = value!; 
                        });
                      },
                    ),
                  )).toList(), // change the iterable returned by .map to list again so that it can be accepted by column
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
