import "package:cloud_firestore/cloud_firestore.dart";
import "package:cmsc_23_proj/api/firebase_organization_api.dart";
import "package:cmsc_23_proj/api/firebase_donation_api.dart";
import "package:cmsc_23_proj/api/firebase_profileOrg.dart";
import "package:cmsc_23_proj/models/donation_model.dart";
import "package:cmsc_23_proj/models/donation_drive_model.dart";
import "package:cmsc_23_proj/models/org_profile_model.dart";
// import "package:cmsc_23_proj/screens/users_view/org_view/orgModel/donationOrgModel.dart";
import "package:flutter/material.dart";
// import "package:route_friends/model/todoModel.dart";
// import "../api/firebase_todo_api.dart";

class OrgsListProvider with ChangeNotifier {
  late FirebaseOrgAPI firebaseService;
  late Stream<QuerySnapshot> _orgStream;

  OrgsListProvider() {
    firebaseService = FirebaseOrgAPI();
    fetchOrg();
  }

  Stream<QuerySnapshot> get orgs => _orgStream;

  fetchOrg() {
    // to get the data from database
    _orgStream = firebaseService.getAllOrgs();
    notifyListeners();
  }
}
