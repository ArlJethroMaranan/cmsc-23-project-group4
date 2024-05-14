import 'package:flutter/material.dart';

class UserSignIn extends StatefulWidget {
  const UserSignIn({super.key});

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  final TextEditingController nameController = TextEditingController();
  String nameInput = "";

  // @override
  // void dispose() {
  //   nameController.dispose();
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   nameController.addListener(() {
  //     widget.onNameChanged(nameController.text, nameController);
  //   });
  // } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 200)),
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
                  if (nameInput == "") return "Username required";
                  return null;
                },
                controller: nameController,
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
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                  label: Text("Password"),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Sign in'),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            const Text("Don't have an account?"),
            const Padding(padding: EdgeInsets.only(top: 5)),
            OutlinedButton(
              onPressed: () {},
              child: const Text("Sign up"),
            ),
          ],
        ),
      )
      
      
    );
  }
}