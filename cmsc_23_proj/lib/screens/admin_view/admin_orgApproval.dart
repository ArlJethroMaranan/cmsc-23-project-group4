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
        return ListTile(
          title: Text(orgList[index]),
          tileColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white),
          trailing: IconButton(
            icon: Icon(Icons.check),
            onPressed: (){},
          ),
          // onTap: ,
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