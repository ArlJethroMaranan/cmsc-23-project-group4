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
  final TextEditingController orgNameController = TextEditingController();
  final TextEditingController proofController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isOrg = false;

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    passController.dispose();
    addr1Controller.dispose();
    addr2Controller.dispose();
    numController.dispose();
    orgNameController.dispose();
    proofController.dispose();
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
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Name required";
                      return null;
                    },
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Name",
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Username required";
                      return null;
                    },
                    controller: usernameController,
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
                      if (value == null || value.isEmpty) return "Password required";
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
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Address required";
                      return null;
                    },
                    controller: addr1Controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Address",
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    controller: addr2Controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Other address",
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Number required";
                      final regex = RegExp(r'^09\d{9}$');
                      if (!regex.hasMatch(value)) {
                        return "Invalid phone number format.";
                      }
                      return null;
                    },
                    controller: numController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Phone Number",
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
                if (isOrg) ...[
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Organization name required";
                        return null;
                      },
                      controller: orgNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(10),
                        labelText: "Organization Name",
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) return "Proof of legitimacy required";
                        return null;
                      },
                      controller: proofController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(10),
                        labelText: "Proof of Legitimacy",
                      ),
                    ),
                  ),
                ],
                const Padding(padding: EdgeInsets.only(top: 10)),
                OutlinedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      final nameInput = nameController.text;
                      final usernameInput = usernameController.text;
                      final passInput = passController.text;
                      final addr1Input = addr1Controller.text;
                      final addr2Input = addr2Controller.text;
                      final numInput = numController.text;
                      final orgNameInput = orgNameController.text;
                      final proofInput = proofController.text;

                      if (isOrg) {
                        Navigator.pushNamed(context, '/');
                      } else {
                        Navigator.pushNamed(context, '/donors-main');
                      }

                      print(nameInput);
                      print(usernameInput);
                      print(passInput);
                      print(addr1Input);
                      print(addr2Input);
                      print(numInput);
                      print(isOrg);
                      if (isOrg) {
                        print(orgNameInput);
                        print(proofInput);
                      }
                    }
                  },
                  child: const Text('Create account'),
                ),
                const Padding(padding: EdgeInsets.only(top: 125)),
              ],
            ),
          ),
        ),
      )
    );
  }
}
