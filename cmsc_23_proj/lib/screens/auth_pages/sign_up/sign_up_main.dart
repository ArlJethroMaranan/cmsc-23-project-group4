import 'package:flutter/material.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController addr1Controller = TextEditingController();
  final TextEditingController addr2Controller = TextEditingController();
  final TextEditingController numController = TextEditingController();

  String nameInput = "";
  String usernameInput = "";
  String passInput = "";
  String addr1Input = "";
  String addr2Input = "";
  String numInput = "";
  bool isOrg = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 125)),
            const Text(
              "Elbi\nDonation\nSystem", 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                validator: (nameInput) {
                  if (nameInput == "") return "Name required";
                  return null;
                },
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                  label: Text("Name"),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                validator: (nameInput) {
                  if (nameInput == "") return "Username required";
                  return null;
                },
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                  label: Text("Username"),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                validator: (nameInput) {
                  if (nameInput == "") return "Password required";
                  return null;
                },
                controller: passController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                  label: Text("Password"),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                validator: (addr1Input) {
                  if (addr1Input == "") return "Address required";
                  return null;
                },
                controller: addr1Controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                  label: Text("Address"),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                // validator: (nameInput) {
                //   if (nameInput == "") return "Address required";
                //   return null;
                // },
                controller: addr2Controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                  label: Text("Other address"),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                validator: (numInput) {
                  if (numInput == "") return "Number required";
                  return null;
                },
                controller: numController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                  label: Text("Phone Number"),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isOrg,
                    onChanged: (bool? value) {
                      setState(() {
                        isOrg = value!;
                      });
                    },
                  ),
                  const Text("Are you signing up as an organization?")
                ],
              )
            ),
            OutlinedButton(
              onPressed: () {
                if (isOrg) {
                  Navigator.pushNamed(context, '/sign-up-org');
                } else {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/sign-in');
                }
              },
              child: const Text('Create account'),
            ),
          ],
        ),
      )
    );
  }
}