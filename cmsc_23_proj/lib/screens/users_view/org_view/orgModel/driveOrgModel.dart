import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonationDriveOrg {
  // initialize data fields
  String? name;
  String? description;
  String? photo;

  DonationDriveOrg({
    this.name,
    this.description,
    this.photo,
  });

  // Factory constructor to instantiate object from json format
  factory DonationDriveOrg.fromJson(Map<String, dynamic> json) {
    return DonationDriveOrg(
      name: json['Name'],
      description: json['Description'],
      photo: json['Photo'],
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
    };
  }
}