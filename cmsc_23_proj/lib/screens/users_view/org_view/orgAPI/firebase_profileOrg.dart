import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/orgModel/donationOrgModel.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/orgModel/profileOrg.dart';
// import 'package:route_friends/model/todoModel.dart';


class FirebaseProfileOrgAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getProfileOrg() {
    return db.collection("organizations").where("orgID", isEqualTo: "En3NVkFvaL905dJ8ii8c").snapshots();
  }

  Future<String> editStatus(String? id, ProfileModelOrg data) async {
    try { 
      await db.collection("organizations").doc(id).update({    // update status
        'status' : data.status,
      }); 
      return "Successfully updated todo!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}"; 
    }
  }

}