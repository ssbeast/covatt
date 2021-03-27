class UserData {
  String id;
  String name;
  String uid;
  String role;
  String contactNumber;
  String integrityKey;
  String imageURL =
      "https://firebasestorage.googleapis.com/v0/b/covatt-7ca4a.appspot.com/o/avatar.jpeg?alt=media&token=d09124e0-0832-4b38-8703-d55d823ffe6a";
  List vaccinations = [];
  List linkedAccounts = [];

  UserData({
    this.id,
    this.uid,
    this.name,
    this.role,
    this.contactNumber,
    this.integrityKey,
    this.vaccinations,
    this.linkedAccounts,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    uid = json['uid'];
    role = json['role'];
    contactNumber = json['contactNumber'];
    integrityKey = json['integrityKey'];
    vaccinations = json["vaccinations"];
    linkedAccounts = json["linkedAccounts"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['uid'] = this.uid;
    data['role'] = this.role;
    data['contactNumber'] = this.contactNumber;
    data['integrityKey'] = this.integrityKey;
    return data;
  }

  Function setImageUrl(String x) {
    this.imageURL = x;
  }
}
