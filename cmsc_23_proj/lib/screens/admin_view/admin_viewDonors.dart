import 'package:cmsc_23_proj/screens/admin_view/admin_viewDonors_donoListView.dart';
import 'package:flutter/material.dart';

class ViewDonorsPage extends StatefulWidget {
  const ViewDonorsPage({super.key});

  @override
  State<ViewDonorsPage> createState() => _ViewDonorsPageState();
}

class _ViewDonorsPageState extends State<ViewDonorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View All Donors"),
      ),
      body: Container(
        margin: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Donors",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Expanded(
                child: DonorsListView())
            ],
          ),
        )
      )
    );
  }
}