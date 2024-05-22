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
                child: Text("org details org details org details org details org details org details org details"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 229, 239, 95)
                    ),
                    onPressed: (){},
                    child: Text("More Info"),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 229, 239, 95)
                    ),
                    onPressed: (){},
                    child: Text("Approve"),
                  ),
                ],
              )
            ],
          // onTap: ,
          )
        );
        
      })
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