import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonationDriveModel {
  // initialize data fields
  String? name;
  String? description;
  String? photo;
  String? orgID;
  String? id; // add id to hold the id of the donation drive in firebase

  DonationDriveModel(
      {this.name, this.description, this.photo, this.orgID, this.id});

  // Factory constructor to instantiate object from json format
  factory DonationDriveModel.fromJson(Map<String, dynamic> json) {
    return DonationDriveModel(
        name: json['Name'],
        description: json['Description'],
        photo: json['Photo'],
        orgID: json['orgID'],
        id: json['id']);
  }

  static List<DonationDriveModel> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data
        .map<DonationDriveModel>((dynamic d) => DonationDriveModel.fromJson(d))
        .toList();
  }

  Map<String, dynamic> toJson(DonationDriveModel donationDriveOrg) {
    return {
      'Name': donationDriveOrg.name,
      'Description': donationDriveOrg.description,
      'Photo': donationDriveOrg.photo,
      'orgID': donationDriveOrg.orgID,
      'id': donationDriveOrg.id
    };
  }
}
