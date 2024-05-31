import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonationModel {
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
  String? driveID;

  DonationModel({
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
    this.driveID,
  });

  // Factory constructor to instantiate object from json format
  factory DonationModel.fromJson(Map<String, dynamic> json) {
    return DonationModel(
      address1: json['address1'],
      address2: json['address2'],
      contactNum: json['contactNum'],
      donationType: json['donationType'],
      photo: json['photo'],
      receiveType: json['receiveType'],
      schedule: json['schedule'],
      weight: json['weight'],
      orgID: json['orgID'],
      driveID: json['driveID'],
      status: json['status'] ?? 'Pending',
    );
  }

  static List<DonationModel> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data
        .map<DonationModel>((dynamic d) => DonationModel.fromJson(d))
        .toList();
  }

  Map<String, dynamic> toJson(DonationModel donationOrg) {
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
      'driveID': donationOrg.driveID,
    };
  }
}