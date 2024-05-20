import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:route_friends/model/todoModel.dart';


class FirebaseDonationOrgAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getAllDonationOrg() {
    return db.collection("donations").snapshots();
  }

}