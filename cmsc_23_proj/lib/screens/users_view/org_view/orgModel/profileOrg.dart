import 'dart:convert';

class ProfileModelOrg {
  // initialize data fields
  String? name;
  String? about;
  String status;
  String? photo;
  String? orgID;

  ProfileModelOrg({
    this.name,
    this.about,
    this.status = "Open",
    this.photo,
    this.orgID
  });

  // Factory constructor to instantiate object from json format
  factory ProfileModelOrg.fromJson(Map<String, dynamic> json) {
    return ProfileModelOrg(
      name: json['name'],
      about: json['about'],
      status: json['status'] ?? "Open",
      photo: json['photo'],
      orgID: json['orgID']
    );
  }

  static List<ProfileModelOrg> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<ProfileModelOrg>((dynamic d) => ProfileModelOrg.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(ProfileModelOrg profileModelOrg) {
    return {
      'Name': profileModelOrg.name,
      'About': profileModelOrg.about,
      'Status': profileModelOrg.status,
      'Photo': profileModelOrg.photo,
      'orgID': profileModelOrg.orgID
    };
  }
}