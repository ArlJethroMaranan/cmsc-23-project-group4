import "package:cloud_firestore/cloud_firestore.dart";
import "package:cmsc_23_proj/api/firebase_donation_api.dart";
import "package:cmsc_23_proj/api/firebase_profileOrg.dart";
import "package:cmsc_23_proj/models/donation_model.dart";
import "package:cmsc_23_proj/models/donation_drive_model.dart";
import "package:cmsc_23_proj/models/org_profile_model.dart";
// import "package:cmsc_23_proj/screens/users_view/org_view/orgModel/donationOrgModel.dart";
import "package:flutter/material.dart";
// import "package:route_friends/model/todoModel.dart";
// import "../api/firebase_todo_api.dart";

class OrgProfileProvider with ChangeNotifier {
  late FirebaseProfileOrgAPI firebaseService;
  late Stream<QuerySnapshot> _profileOrgStream;

  OrgProfileProvider() {
    firebaseService = FirebaseProfileOrgAPI();
    fetchProfileOrg();
  }

  Stream<QuerySnapshot> get profileOrg => _profileOrgStream;

  fetchProfileOrg() {
    // to get the data from database
    _profileOrgStream = firebaseService.getProfileOrg();
    notifyListeners();
  }

  void editStatus(String index, OrgProfileModel data) async {
    // to edit status for profile
    await firebaseService.editStatus(index, data);
    notifyListeners();
  }
}
