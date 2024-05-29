import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  List<Map<String, dynamic>> dummyUsers = [
    {
      "id": "En3NVkFvaL905dJ8ii8c",
      "email": "seventeen@gmail.com",
      "type": "organization",
      "password": "12345678"
    },
    {
      "id": "4h4r7ZnZPuFnnDEN39Dm",
      "email": "jem@gmail.com",
      "type": "donor",
      "password": "12345678"
    }
  ];

  Map<String, dynamic> admin = {
    "id": "",
    "email": "admin@gmail.com",
    "type": "admin",
    "password": "12345678"
  };

  Map<String, dynamic> _currentUser = {
    "id": "",
    "email": "",
    "type": "guest",
    "password": ""
  };

  Map<String, dynamic> get currentUser => _currentUser;

  String signIn(String email, String password) {
    if (email == admin["email"] && password == admin["password"]) {
      _currentUser = admin;
    }
    Map<String, dynamic> user = dummyUsers.firstWhere(
        (dummyUser) =>
            dummyUser["email"] == email && dummyUser["password"] == password,
        orElse: () => {"id": "", "email": "", "type": "guest", "password": ""});
    if (user["id"] != "") {
      _currentUser = user;
      return "Current user updated";
    } else {
      return "User not found";
    }
  }

  String signOut() {
    _currentUser = {"id": "", "email": "", "type": "guest", "password": ""};
    return "User signed out";
  }
}
