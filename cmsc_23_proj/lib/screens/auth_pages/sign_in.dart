import 'package:flutter/material.dart';

class UserSignIn extends StatefulWidget {
  const UserSignIn({super.key});

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username required";
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Username",
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password required";
                      }
                      return null;
                    },
                    controller: passController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Password",
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                OutlinedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/donors-main');
                    }
                  },
                  child: const Text('Sign in'),
                ),
                const Padding(padding: EdgeInsets.only(top: 30)),
                const Text("Don't have an account?"),
                const Padding(padding: EdgeInsets.only(top: 5)),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up');
                  },
                  child: const Text("Sign up"),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/admin-main');
                  },
                  child: const Text("Admin"),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/orgs-main');
                  },
                  child: const Text("Orgs"),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
