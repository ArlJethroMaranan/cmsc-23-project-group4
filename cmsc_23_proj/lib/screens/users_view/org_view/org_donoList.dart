import 'package:cmsc_23_proj/screens/users_view/org_view/drawer.dart';
import 'package:flutter/material.dart';

class DonationList extends StatefulWidget {
  const DonationList({super.key});

  @override
  State<DonationList> createState() => _DonationListState();
}

class _DonationListState extends State<DonationList> {
  final List<List<dynamic>> donations = [
    ["Help Jonathan Joestar finish his house.", 2500, "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc et aliquet lectus, id ornare ligula. Aenean sit amet tempor ipsum. Vestibulum maximus egestas leo sed fermentum. Mauris vel sapien placerat enim viverra euismod. Ut eu elementum mi. Integer euismod ipsum id pellentesque ornare. Nullam ac tellus interdum urna placerat bibendum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt justo nec eros convallis gravida. Sed at magna eu sem efficitur tempor in ac metus. Aliquam bibendum, neque dictum efficitur lacinia, nulla nisi euismod tellus, a malesuada sapien nisl non est. Nam placerat dolor sapien, ac tempor neque facilisis id."],
    ["Dummy name 2", 2500, "description"],
    ["Dummy name 3", 2500, "description"],
    ["Dummy name 4", 2500, "description"],
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
        itemCount: donations.length,
        itemBuilder: (context, index) {
          final donation = donations[index];
          return Card( // Wrapped expansion tile with Card
          color: Color.fromARGB(255, 214, 126, 62),
            child: ExpansionTile(
              backgroundColor: Color.fromARGB(255, 219, 110, 32),
              title: Text(
                donation[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Current Amount Raised: ${donation[1]}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    donation[2],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}