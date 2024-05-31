import "package:cloud_firestore/cloud_firestore.dart";
import "package:cmsc_23_proj/api/firebase_donation_api.dart";
import "package:cmsc_23_proj/api/firebase_drive_api.dart";
import "package:cmsc_23_proj/models/donation_model.dart";
import "package:cmsc_23_proj/models/donation_drive_model.dart";
// import "package:cmsc_23_proj/screens/users_view/org_view/orgModel/donationOrgModel.dart";
import "package:flutter/material.dart";
// import "package:route_friends/model/todoModel.dart";
// import "../api/firebase_todo_api.dart";

class DonationDriveOrgListProvider with ChangeNotifier {
  late FirebaseDonoDriveOrgAPI firebaseService;
  late Stream<QuerySnapshot> _donationDriveOrgStream;
  DonationDriveModel?
      _selectedDrive; // create instance of drive org called selected drive

  DonationDriveOrgListProvider() {
    firebaseService = FirebaseDonoDriveOrgAPI();
    fetchDonationDriveOrg();
  }

  Stream<QuerySnapshot> get donationDriveOrg => _donationDriveOrgStream;
  DonationDriveModel get selectedDrive =>
      _selectedDrive!; // create getter method

  updateSelectedDrive(DonationDriveModel donationDriveOrg) {
    _selectedDrive =
        donationDriveOrg; // set donodrive org as current selected drive
    notifyListeners();
  }

  fetchDonationDriveOrg() {
    // to get the data from database
    _donationDriveOrgStream = firebaseService.getAllDonationDriveOrg();
    notifyListeners();
  }

  void addDrive(DonationDriveModel item) async {
    String message = await firebaseService.addDrive(item.toJson(item));
    print(message);
    notifyListeners();
  }

  void editDrive(String index, DonationDriveModel data) async {
    await firebaseService.editDrive(index, data);
    notifyListeners();
  }

  Future<String> deleteDrive(String id) async {
    await firebaseService.deleteDrive(id);

    notifyListeners();
    return "Deleted";
  }
}
