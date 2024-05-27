import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDonoDriveOrgAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAllDonationOrg() {
    return db.collection("donation_drives").snapshots();
  }

  Future<String> addDrive(Map<String, dynamic> donationDriveOrg) async {
    try{
      await db.collection("donation_drives").add(donationDriveOrg);

      return "Successfully added slamFriends!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }


}