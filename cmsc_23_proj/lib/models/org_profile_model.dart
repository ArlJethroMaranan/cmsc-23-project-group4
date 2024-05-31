import 'dart:convert';

class OrgProfileModel {
  // initialize data fields
  String? name;
  String? about;
  String status;
  String? photo;
  String? orgID;

  OrgProfileModel(
      {this.name, this.about, this.status = "Open", this.photo, this.orgID});

  // Factory constructor to instantiate object from json format
  factory OrgProfileModel.fromJson(Map<String, dynamic> json) {
    return OrgProfileModel(
        name: json['name'],
        about: json['about'],
        status: json['status'] ?? "Open",
        photo: json['photo'],
        orgID: json['orgID']);
  }

  static List<OrgProfileModel> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data
        .map<OrgProfileModel>((dynamic d) => OrgProfileModel.fromJson(d))
        .toList();
  }

  Map<String, dynamic> toJson(OrgProfileModel profileModelOrg) {
    return {
      'Name': profileModelOrg.name,
      'About': profileModelOrg.about,
      'Status': profileModelOrg.status,
      'Photo': profileModelOrg.photo,
      'orgID': profileModelOrg.orgID
    };
  }
}
