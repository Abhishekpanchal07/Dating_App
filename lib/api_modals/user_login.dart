class UserLogIn {
  UserLogIn({
    required this.success,
    required this.message,
     this.data,
     this.jwtToken,
  });
  late final bool success;
  late final String message;
   Data? data;
   String? jwtToken;
  
  UserLogIn.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = json['data'] == null ? null : Data.fromJson(json['data']);
    jwtToken = json['jwtToken'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['success'] = success;
    getdata['message'] = message;
   // getdata['data'] = data!.toJson();
    getdata['jwtToken'] = jwtToken;
    return getdata;
  }
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.password,
    required this.status,
    required this.disableStatus,
    required this.activeStatus,
    required this.ageRestriction,
    required this.distanceRestriction,
    required this.isActive,
    required this.createdAt,
    required this.V,
  });
  late final String id;
  late final String email;
  late final String password;
  late final int status;
  late final int disableStatus;
  late final String activeStatus;
  late final int ageRestriction;
  late final int distanceRestriction;
  late final bool isActive;
  late final String createdAt;
  late final int V;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    email = json['email'];
    password = json['password'];
    status = json['status'];
    disableStatus = json['disableStatus'];
    activeStatus = json['activeStatus'];
    ageRestriction = json['ageRestriction'];
    distanceRestriction = json['distanceRestriction'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['_id'] = id;
    getdata['email'] = email;
    getdata['password'] = password;
    getdata['status'] = status;
    getdata['disableStatus'] = disableStatus;
    getdata['activeStatus'] = activeStatus;
    getdata['ageRestriction'] = ageRestriction;
    getdata['distanceRestriction'] = distanceRestriction;
    getdata['isActive'] = isActive;
    getdata['createdAt'] = createdAt;
    getdata['__v'] = V;
    return getdata;
  }
}