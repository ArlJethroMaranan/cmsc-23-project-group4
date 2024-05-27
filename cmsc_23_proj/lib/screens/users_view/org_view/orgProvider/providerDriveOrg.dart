import "package:cloud_firestore/cloud_firestore.dart";
import "package:cmsc_23_proj/screens/users_view/org_view/orgAPI/firebase_donation_api.dart";
import "package:cmsc_23_proj/screens/users_view/org_view/orgAPI/firebase_drive_api.dart";
import "package:cmsc_23_proj/screens/users_view/org_view/orgModel/donationOrgModel.dart";
import "package:cmsc_23_proj/screens/users_view/org_view/orgModel/driveOrgModel.dart";
// import "package:cmsc_23_proj/screens/users_view/org_view/orgModel/donationOrgModel.dart";
import "package:flutter/material.dart";
// import "package:route_friends/model/todoModel.dart";
// import "../api/firebase_todo_api.dart";

class DonationDriveOrgListProvider with ChangeNotifier {

  late FirebaseDonoDriveOrgAPI firebaseService;
  late Stream<QuerySnapshot> _donationDriveOrgStream;
  DonationDriveOrg? _selectedDrive;

  DonationDriveOrgListProvider() {
    firebaseService = FirebaseDonoDriveOrgAPI();
    fetchDonationDriveOrg();
  }

  Stream<QuerySnapshot> get donationDriveOrg => _donationDriveOrgStream;
  DonationDriveOrg get selectedDrive => _selectedDrive!;

  updateSelectedDrive(DonationDriveOrg donationDriveOrg){
    _selectedDrive = donationDriveOrg;
    notifyListeners();
  }

  fetchDonationDriveOrg() { // to get the data from database
    _donationDriveOrgStream = firebaseService.getAllDonationOrg();
    notifyListeners();
  }

  void addDrive(DonationDriveOrg item) async {
    String message = await firebaseService.addDrive(item.toJson(item));
    print(message);
    notifyListeners();
  }

}