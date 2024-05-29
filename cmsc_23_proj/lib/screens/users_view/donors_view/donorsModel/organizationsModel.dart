import 'dart:convert';

class OrgModel {
  // initialize data fields
  String? about;
  String? name;
  String? orgID;
  String? photo;
  String? status;

  OrgModel({
    this.about,
    this.name,
    this.orgID,
    this.photo,
    this.status
  });

  // Factory constructor to instantiate object from json format
  factory OrgModel.fromJson(Map<String, dynamic> json) {
    return OrgModel(
      about: json['about'],
      name: json['name'],
      orgID: json['orgID'],
      photo: json['photo'],
      status: json['status'],
    );
  }

  static List<OrgModel> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<OrgModel>((dynamic d) => OrgModel.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(OrgModel organization) {
    return {
      'about': organization.about,
      'name': organization.name,
      'orgID': organization.orgID,
      'photo': organization.photo,
      'status': organization.status
    };
  }
}