import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/orgModel/driveOrgModel.dart';

class FirebaseDonoDriveOrgAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  // kapag meron ng auth lagyan ng String? uid yung parameter
  Stream<QuerySnapshot> getAllDonationDriveOrg() {
    return db.collection("donation_drives").snapshots();
    //return db.collection("donation_drives").where("orgID": isEqualTo: uid).snapshots();
  }

  Future<String> addDrive(Map<String, dynamic> donationDriveOrg) async {
    try{ 
      await db.collection("donation_drives").add(donationDriveOrg);

      return "Successfully added slamFriends!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  Future<String> deleteDrive(String? id) async {
    try { 
      await db.collection("donation_drives").doc(id).delete(); 
      return "Successfully deleted todo!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}"; 
    }
  }

  Future<String> editDrive(String? id, DonationDriveOrg data) async {
    try { 
      await db.collection("donation_drives").doc(id).update({    // update the data inside the model (passed by the parameter Todo data)
        'Name': data.name,
        'Description': data.description,
        'Photo': data.photo,
        // 'orgID': data.orgID
      }); 
      return "Successfully updated todo!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}"; 
    }
  }

}