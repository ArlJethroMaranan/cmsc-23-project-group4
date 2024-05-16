import 'package:flutter/material.dart';

class ViewDonorsPage extends StatefulWidget {
  const ViewDonorsPage({super.key});

  @override
  State<ViewDonorsPage> createState() => _ViewDonorsPageState();
}

class _ViewDonorsPageState extends State<ViewDonorsPage> {
  List<String> donorList = [
    "Jem"
  ];

  Widget donorListView(){
    return ListView.builder(
      itemCount: donorList.length,
      itemBuilder: ((context, index) {
        return ListTile(
          title: Text(donorList[index]),
          tileColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white),
          // onTap: ,
        );
      })
    );
  }

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
              Expanded(child: donorListView())
            ],
          ),
        )
      )
    );
  }
}