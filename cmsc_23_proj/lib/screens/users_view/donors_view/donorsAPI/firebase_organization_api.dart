import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmsc_23_proj/screens/users_view/org_view/orgModel/donationOrgModel.dart';
// import 'package:route_friends/model/todoModel.dart';


class FirebaseOrgAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAllOrgs() {
    return db.collection("organizations").snapshots();
  }

}