import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Donation {
  // initialize data fields
  String? address1;
  String? address2;
  int contactNum;
  String? donationType;
  String? photo;
  bool receiveType;
  Timestamp schedule;
  int weight;
  String deliveryType;
  String status;

  Donation({
    required this.address1,
    required this.address2,
    required this.contactNum,
    required this.donationType,
    required this.photo,
    required this.receiveType,
    required this.schedule,
    required this.weight,
    required this.deliveryType,
    this.status = "Pending"
  });

  // Factory constructor to instantiate object from json format
  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      address1: json['address1'],
      address2: json['address2'],
      contactNum: json['contactNum'],
      donationType: json['donationType'],
      photo: json['photo'],
      receiveType: json['receiveType'],
      schedule: json['schedule'],
      weight: json['weight'],
      deliveryType: json['deliveryType'],
      status: json['status'] ?? 'Pending', 
    );
  }

  static List<Donation> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Donation>((dynamic d) => Donation.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Donation donation) {
    return {
      'address1': donation.address1,
      'address2': donation.address2,
      'contactNum': donation.contactNum,
      'donationType': donation.donationType,
      'photo': donation.photo,
      'receiveType': donation.receiveType,
      'schedule': donation.schedule,
      'weight': donation.weight,
      'deliveryType': donation.deliveryType,
      'status': donation.status
    };
  }
}

class OrgForApproval {
  // initialize data fields
  String? id;
  String name;
  String about;
  String proof;

  OrgForApproval({
    this.id,
    required this.name,
    required this.about,
    required this.proof
  });

  // Factory constructor to instantiate object from json format
  factory OrgForApproval.fromJson(Map<String, dynamic> json) {
    return OrgForApproval(
      id: json['id'],
      name: json['name'],
      about: json['about'],
      proof: json['proof'], 
    );
  }

  static List<OrgForApproval> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<OrgForApproval>((dynamic d) => OrgForApproval.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(OrgForApproval orgForApproval) {
    return {
      'name': orgForApproval.name,
      'about': orgForApproval.about,
      'proof': orgForApproval.proof
    };
  }
}

class Organization {
  // initialize data fields
  String name;
  String about;
  String status;

  Organization({
    required this.name,
    required this.about,
    required this.status
  });

  // Factory constructor to instantiate object from json format
  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      name: json['name'],
      about: json['about'],
      status: json['status'], 
    );
  }

  static List<Organization> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Organization>((dynamic d) => Organization.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Organization organization) {
    return {
      'name': organization.name,
      'about': organization.about,
      'status': organization.status
    };
  }
}

class Donor {
  // initialize data fields
  String name;
  String username;
  String address1;
  String contactNum;

  Donor({
    required this.name,
    required this.username,
    required this.address1,
    required this.contactNum
  });

  // Factory constructor to instantiate object from json format
  factory Donor.fromJson(Map<String, dynamic> json) {
    return Donor(
      name: json['name'],
      username: json['username'],
      address1: json['address1'],
      contactNum: json['contactNum'],
    );
  }

  static List<Donor> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Donor>((dynamic d) => Donor.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Donor donor) {
    return {
      'name': donor.name,
      'username': donor.username,
      'address1': donor.address1,
      'contactNum': contactNum
    };
  }
}