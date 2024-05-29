import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/orgModel/donationOrgModel.dart';
// import 'package:route_friends/model/todoModel.dart';


class FirebaseDonationOrgAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAllDonationOrg() {
    return db.collection("donations").snapshots();
  }

  Future<String> editStatus(String? id, DonationOrg data) async {
    try { 
      await db.collection("donations").doc(id).update({    // update status
        'status' : data.status,
      }); 
      return "Successfully updated todo!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}"; 
    }
  }

}