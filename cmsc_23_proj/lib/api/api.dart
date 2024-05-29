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

  Future<DocumentSnapshot> getOrganizationById(String id) async {
    return await db.collection("organizations").doc(id).get();
  }

  Future<String> addOrganization(Map<String, dynamic> organization) async {
    try {
      await db.collection("organizations").add(organization);
      return "Organization approved!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }
}

class FirebaseOrgsForApprovalAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAllOrgsForApproval() {
    return db.collection("organizationsForApproval").snapshots();
  }

  Future<String> addOrgForApproval(Map<String, dynamic> organization) async {
    try {
      await db.collection("organizationsForApproval").add(organization);
      return "Organization sign-up successful!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  Future<String> deleteOrgForApproval(String id) async {
    try {
      await db.collection("organizationsForApproval").doc(id).delete();

      return "Organization For Approval successfully deleted!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }
}

class FirebaseDonorsAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAllDonors() {
    return db.collection("donors").snapshots();
  }

  Future<DocumentSnapshot> getDonorById(String id) async {
    return await db.collection("donors").doc(id).get();
  }

  Future<String> addDonor(Map<String, dynamic> donor) async {
    try {
      await db.collection("donors").add(donor);
      return "Donor sign-up successful!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }
}
