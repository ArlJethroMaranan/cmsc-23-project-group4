import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewOrgsDonaPage extends StatefulWidget {
  const ViewOrgsDonaPage({super.key});

  @override
  State<ViewOrgsDonaPage> createState() => _ViewOrgsDonaPageState();
}

class _ViewOrgsDonaPageState extends State<ViewOrgsDonaPage> {
  List<String> orgList = [
    "Seventeen",
    "EXO"
  ];

  List<String> donationList = [
    "donation 1",
    "donation 2",
    "donation 3",
    "donation 4",
    "donation 5"
  ];

  Widget orgListView(){
    return ListView.builder(
      itemCount: orgList.length,
      itemBuilder: ((context, index) {
        return Card(
          color: Color.fromARGB(255, 232, 139, 57),
          child: ExpansionTile(
            title: Row(children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width / 7,
              height: MediaQuery.of(context).size.width / 7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(300.0),
                child: Image.asset('./assets/orgLogo1.jpg', fit: BoxFit.cover,),
              ),
            ),
            Text(orgList[index], style: const TextStyle(color: Colors.white),),
          ],),
            collapsedBackgroundColor: Color.fromARGB(255, 232, 139, 57),
            backgroundColor: Colors.orangeAccent,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("About the organization")),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("Status for Donations: ")
                      ),
                      SizedBox(
                        height: 220,
                        child: donationListView()
                      )
                    ],
                  ),
              )
            ]
          )
        );  
      })
    );
  }

  Widget donationListView(){
    return ListView.builder(
      itemCount: donationList.length,
      itemBuilder: ((context, index) {
        return ListTile(
          title: Text(donationList[index]),
          titleTextStyle: TextStyle(color: Colors.white),
          subtitle: Text("donation info"),
          trailing: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 229, 239, 95)
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute<Widget>(builder: (BuildContext context) {
                return Expanded(child: donationDetails(donationList[index])); }));
            },
            child: Text("More Info"),
          ),
        );
      })
    );
  }

  Widget donationDetails(donation){
    return Scaffold(
      appBar: AppBar(title: Text("${donation}")),
      body: Container(
        padding: EdgeInsets.all(17),
        child: Column(
          children: [
            // const Text("Summary", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("status"),
            ),
            const Column(
              children: [
                  Row(
                    children: [ 
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text("donation items categories"),
                            Text("donation items weight")
                          ],
                        )
                      ),
                      Image(
                        image: AssetImage("./assets/donation.png"),
                        height: 100,
                        width: 100,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [ 
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("for pickup/dropoff")),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("pickup/dropoff location")
                      )
                    ],
                  ),
                  //if for pickup
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("addresses")
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("contact no")
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Back")
                )
              ]
            )
          ]
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View All Organizations and Donations"),
      ),
      body: Container(
        margin: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Organizations",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Expanded(child: orgListView())
            ],
          ),
        )
      )
    );
  }

  
}