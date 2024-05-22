import 'package:flutter/material.dart';

class OrgApprovalPage extends StatefulWidget {
  const OrgApprovalPage({super.key});

  @override
  State<OrgApprovalPage> createState() => _OrgApprovalPageState();
}

class _OrgApprovalPageState extends State<OrgApprovalPage> {
  List<String> orgList = [
    "Going Rangers"
  ];

  Widget orgListView(){
    return ListView.builder(
      itemCount: orgList.length,
      itemBuilder: ((context, index) {
        return Card(
          color: Color.fromARGB(255, 232, 139, 57),
          child: ExpansionTile(
            title: Text(orgList[index]),
            backgroundColor: Colors.orangeAccent,
            children: [
              const Padding(
                padding: const EdgeInsets.all(16),
                child: Text("About the organization"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 229, 239, 95)
                    ),
                    onPressed: (){},
                    child: Text("Approve"),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 229, 239, 95)
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute<Widget>(builder: (BuildContext context) {
                        return Expanded(child: orgDetails(orgList[index])); }));
                    },
                    child: Text("More Info"),
                  ),
                ],
              )
            ],
          )
        );
        
      })
    );
  }

  Widget orgDetails(organization){
    return Scaffold(
      appBar: AppBar(title: Text("${organization}")),
      body: Container(
        padding: EdgeInsets.all(17),
        child: Column(
          children: [
            // const Text("Summary", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("About the organization"),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("Proofs of Legitimacy"), //can do gridbuilder to show pics
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Approve")
                ),
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
        title: Text("Organizations for Approval"),
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