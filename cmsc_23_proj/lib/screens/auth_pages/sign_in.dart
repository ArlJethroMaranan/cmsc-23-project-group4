import 'package:cmsc_23_proj/provider/auth_provider.dart';
import 'package:cmsc_23_proj/provider/org_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
    context
        .read<AuthProvider>()
        .signIn(nameController.text, passController.text);
  }

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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email required";
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                    labelText: "Email",
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
                    context
                        .read<AuthProvider>()
                        .signIn(nameController.text, passController.text);
                    Map<String, dynamic> currentUser =
                        context.read<AuthProvider>().currentUser;

                    if (currentUser["type"] == "donor") {
                      Navigator.pushNamed(context, '/donors-main');
                    } else if (currentUser["type"] == "organization") {
                      Map<String, dynamic> currentUser = context.read<AuthProvider>().currentUser; // set current user to the logged in org
                      context.read<OrgProfileProvider>().changeProfileOrgById(currentUser['id']); // pass the id of current org to orgMain
                      Navigator.pushNamed(context, '/orgs-main');
                    } else if (currentUser["type"] == "admin") {
                      Navigator.pushNamed(context, '/admin-main');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Inavlid email or password!'),
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Inavlid email or password!'),
                    ));
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
    ));
  }
}
