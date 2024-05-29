import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonationOrg {
  // initialize data fields
  String? address1;
  String? address2;
  int? contactNum;
  String? donationType;
  String? photo;
  bool? receiveType;
  Timestamp? schedule;
  int? weight;
  String status;
  String? orgID;
  

  DonationOrg({
    this.address1,
    this.address2,
    this.contactNum,
    this.donationType,
    this.photo,
    this.receiveType,
    this.schedule,
    this.weight,
    this.status = "Pending",
    this.orgID,
  });

  // Factory constructor to instantiate object from json format
  factory DonationOrg.fromJson(Map<String, dynamic> json) {
    return DonationOrg(
      address1: json['address1'],
      address2: json['address2'],
      contactNum: json['contactNum'],
      donationType: json['donationType'],
      photo: json['photo'],
      receiveType: json['receiveType'],
      schedule: json['schedule'],
      weight: json['weight'],
      orgID: json['orgID'],
      status: json['status'] ?? 'Pending', 
    );
  }

  static List<DonationOrg> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<DonationOrg>((dynamic d) => DonationOrg.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(DonationOrg donationOrg) {
    return {
      'address1': donationOrg.address1,
      'address2': donationOrg.address2,
      'contactNum': donationOrg.contactNum,
      'donationType': donationOrg.donationType,
      'photo': donationOrg.photo,
      'receiveType': donationOrg.receiveType,
      'schedule': donationOrg.schedule,
      'weight': donationOrg.weight,
      'status': donationOrg.status,
      'orgID': donationOrg.orgID,
    };
  }
}