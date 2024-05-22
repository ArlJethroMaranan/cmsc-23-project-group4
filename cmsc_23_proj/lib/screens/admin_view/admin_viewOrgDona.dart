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
            onPressed: (){},
            child: Text("More Info"),
          ),
        );
      })
    );
  }

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
                child: SizedBox(
                  height: 220,
                  child: donationListView(),
            )
              )
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