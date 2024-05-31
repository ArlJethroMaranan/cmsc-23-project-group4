import "package:cloud_firestore/cloud_firestore.dart";
import "package:cmsc_23_proj/api/firebase_donation_api.dart";
import "package:cmsc_23_proj/models/donation_model.dart";
import "package:cmsc_23_proj/models/donation_drive_model.dart";
// import "package:cmsc_23_proj/screens/users_view/org_view/orgModel/donationOrgModel.dart";
import "package:flutter/material.dart";
// import "package:route_friends/model/todoModel.dart";
// import "../api/firebase_todo_api.dart";

class DonationOrgListProvider with ChangeNotifier {
  late FirebaseDonationOrgAPI firebaseService;
  late Stream<QuerySnapshot> _donationOrgStream;

  DonationOrgListProvider() {
    firebaseService = FirebaseDonationOrgAPI();
    fetchDonationOrg();
  }

  Stream<QuerySnapshot> get donationOrg => _donationOrgStream;

  fetchDonationOrg() {
    // to get the data from database
    _donationOrgStream = firebaseService.getAllDonationOrg();
    notifyListeners();
  }

  void editStatus(String index, DonationModel data) async {
    // to edit status for donation
    await firebaseService.editStatus(index, data);
    notifyListeners();
  }

  void editDonationType(String index, DonationModel data) async {
    await firebaseService.editDonationType(index, data);
    notifyListeners();
  }

  void addDonation(DonationModel item) async {
    String message = await firebaseService.addDonation(item.toJson(item));
    print(message);
    notifyListeners();
  }
}
