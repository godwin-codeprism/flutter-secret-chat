final currentUser = UserObject();

class UserObject {
  String displayName;
  String providerId;
  String uid;
  Null phoneNumber;
  bool isEmailVerified;
  List<ProviderData> providerData;
  String email;
  String photoUrl;
  String lastSignInTimestamp;
  bool isAnonymous;
  int creationTimestamp;

  UserObject(
      {this.displayName,
        this.providerId,
        this.uid,
        this.phoneNumber,
        this.isEmailVerified,
        this.providerData,
        this.email,
        this.photoUrl,
        this.lastSignInTimestamp,
        this.isAnonymous,
        this.creationTimestamp});

  UserObject.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    providerId = json['providerId'];
    uid = json['uid'];
    phoneNumber = json['phoneNumber'];
    isEmailVerified = json['isEmailVerified'];
    if (json['providerData'] != null) {
      providerData = new List<ProviderData>();
      json['providerData'].forEach((v) {
        providerData.add(new ProviderData.fromJson(v));
      });
    }
    email = json['email'];
    photoUrl = json['photoUrl'];
    lastSignInTimestamp = json['lastSignInTimestamp'];
    isAnonymous = json['isAnonymous'];
    creationTimestamp = json['creationTimestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['providerId'] = this.providerId;
    data['uid'] = this.uid;
    data['phoneNumber'] = this.phoneNumber;
    data['isEmailVerified'] = this.isEmailVerified;
    if (this.providerData != null) {
      data['providerData'] = this.providerData.map((v) => v.toJson()).toList();
    }
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['lastSignInTimestamp'] = this.lastSignInTimestamp;
    data['isAnonymous'] = this.isAnonymous;
    data['creationTimestamp'] = this.creationTimestamp;
    return data;
  }
}

class ProviderData {
  String email;
  String providerId;
  String photoUrl;
  String displayName;
  String uid;
  Null phoneNumber;

  ProviderData(
      {this.email,
        this.providerId,
        this.photoUrl,
        this.displayName,
        this.uid,
        this.phoneNumber});

  ProviderData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    providerId = json['providerId'];
    photoUrl = json['photoUrl'];
    displayName = json['displayName'];
    uid = json['uid'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['providerId'] = this.providerId;
    data['photoUrl'] = this.photoUrl;
    data['displayName'] = this.displayName;
    data['uid'] = this.uid;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}