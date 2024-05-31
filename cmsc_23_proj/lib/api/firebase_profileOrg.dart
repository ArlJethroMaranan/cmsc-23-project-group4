import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/models/donation_model.dart';
import 'package:cmsc_23_proj/models/org_profile_model.dart';
// import 'package:route_friends/model/todoModel.dart';

class FirebaseProfileOrgAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getProfileOrg(String id) {
    return db
        .collection("organizations")
        .where("orgID", isEqualTo: id)
        .snapshots();
  }

  Future<String> editStatus(String? id, OrgProfileModel data) async {
    try {
      await db.collection("organizations").doc(id).update({
        // update status
        'status': data.status,
      });
      return "Successfully updated todo!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }
}
