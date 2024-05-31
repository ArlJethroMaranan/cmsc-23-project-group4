import "package:cloud_firestore/cloud_firestore.dart";
import "package:cmsc_23_proj/api/api.dart";
import "package:cmsc_23_proj/models/models.dart";
import "package:flutter/material.dart";

class DonationListProvider with ChangeNotifier {

  late FirebaseDonationAPI firebaseService;
  late Stream<QuerySnapshot> _donationStream;

  DonationListProvider() {
    firebaseService = FirebaseDonationAPI();
    fetchDonation();
  }

  Stream<QuerySnapshot> get donation => _donationStream;

  fetchDonation() { // to get the data from database
    _donationStream = firebaseService.getAllDonation();
    notifyListeners();
  }

}

class OrganizationsListProvider with ChangeNotifier {

  late FirebaseOrganizationsAPI firebaseService;
  late Stream<QuerySnapshot> _organizationStream;

  OrganizationsListProvider() {
    firebaseService = FirebaseOrganizationsAPI();
    fetchOrganizations();
  }

  Stream<QuerySnapshot> get organization => _organizationStream;

  fetchOrganizations() { // to get the data from database
    _organizationStream = firebaseService.getAllOrganizations();
    notifyListeners();
  }

  void addOrganization(Organization org) async {
    String message = await firebaseService.addOrganization(org.toJson(org));
    print(message);
    notifyListeners();
  }

}

class OrgsForApprovalListProvider with ChangeNotifier {

  late FirebaseOrgsForApprovalAPI firebaseService;
  late Stream<QuerySnapshot> _orgsForApprovalStream;

  OrgsForApprovalListProvider() {
    firebaseService = FirebaseOrgsForApprovalAPI();
    fetchOrgsForApproval();
  }

  Stream<QuerySnapshot> get orgsForApproval => _orgsForApprovalStream;

  fetchOrgsForApproval() { // to get the data from database
    _orgsForApprovalStream = firebaseService.getAllOrgsForApproval();
    notifyListeners();
  }

  void addOrgForApproval(OrgForApproval org) async {
    String message = await firebaseService.addOrgForApproval(org.toJson(org));
    print(message);
    notifyListeners();
  }

  void deleteOrgForApproval(String id) async {
    await firebaseService.deleteOrgForApproval(id);
    notifyListeners();
  }

}

class DonorsListProvider with ChangeNotifier {

  late FirebaseDonorsAPI firebaseService;
  late Stream<QuerySnapshot> _donorsStream;

  DonorsListProvider() {
    firebaseService = FirebaseDonorsAPI();
    fetchDonors();
  }

  Stream<QuerySnapshot> get donors => _donorsStream;

  fetchDonors() { // to get the data from database
    _donorsStream = firebaseService.getAllDonors();
    notifyListeners();
  }

  void addDonor(Donor donor) async {
    String message = await firebaseService.addDonor(donor.toJson(donor));
    print(message);
    notifyListeners();
  }

}