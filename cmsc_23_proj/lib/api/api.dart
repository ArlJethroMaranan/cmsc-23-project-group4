import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDonationAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAllDonation() {
    return db.collection("donations").snapshots();
  }

}

class FirebaseOrganizationsAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAllOrganizations() {
    return db.collection("organizations").snapshots();
  }

}

class FirebaseOrgsForApprovalAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAllOrgsForApproval() {
    return db.collection("organizationsForApproval").snapshots();
  }

}