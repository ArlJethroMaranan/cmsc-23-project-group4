import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonationDriveOrg {
  // initialize data fields
  String? name;
  String? description;
  String? photo;
  String? orgID;
  String? id; // add id to hold the id of the donation drive in firebase

  DonationDriveOrg({
    this.name,
    this.description,
    this.photo,
    this.orgID,
    this.id
  });

  // Factory constructor to instantiate object from json format
  factory DonationDriveOrg.fromJson(Map<String, dynamic> json) {
    return DonationDriveOrg(
      name: json['Name'],
      description: json['Description'],
      photo: json['Photo'],
      orgID: json['orgID'],
      id: json['id']
    );
  }

  static List<DonationDriveOrg> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<DonationDriveOrg>((dynamic d) => DonationDriveOrg.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(DonationDriveOrg donationDriveOrg) {
    return {
      'Name': donationDriveOrg.name,
      'Description': donationDriveOrg.description,
      'Photo': donationDriveOrg.photo,
      'orgID': donationDriveOrg.orgID,
      'id': donationDriveOrg.id
    };
  }
}