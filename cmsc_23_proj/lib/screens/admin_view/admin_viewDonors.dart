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
        return Card(
          color: Color.fromARGB(255, 232, 139, 57),
          child: ExpansionTile(
            title: 
              Text(donorList[index]),
            collapsedBackgroundColor: const Color.fromARGB(255, 232, 130, 57),
            backgroundColor: Colors.orangeAccent,
            children: [
              const Padding(
                padding: const EdgeInsets.all(16),
                child: Text("donor info donor info donor info donor info donor info donor info donor info donor info donor info ")
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 229, 239, 95)
                ),
                onPressed: (){},
                child: Text("More Info"),
              ),
            ]
          )
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
              Expanded(
                child: donorListView())
            ],
          ),
        )
      )
    );
  }
}