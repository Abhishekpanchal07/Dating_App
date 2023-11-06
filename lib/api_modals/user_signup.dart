class UserSignup {
  UserSignup({
    required this.success,
    required this.message,
    required this.data,
    required this.jwtToken,
  });
  late final bool success;
  late final String message;
  late final Data data;
  late final String jwtToken;
  
  UserSignup.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = Data.fromJson(json['data']);
    jwtToken = json['jwtToken'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.toJson();
    _data['jwtToken'] = jwtToken;
    return _data;
  }
}

class Data {
  Data({
    required this.email,
    required this.password,
    required this.status,
    required this.disableStatus,
    required this.activeStatus,
    required this.ageRestriction,
    required this.distanceRestriction,
    required this.isActive,
    required this.id,
    required this.createdAt,
    required this.V,
  });
  late final String email;
  late final String password;
  late final int status;
  late final int disableStatus;
  late final String activeStatus;
  late final int ageRestriction;
  late final int distanceRestriction;
  late final bool isActive;
  late final String id;
  late final String createdAt;
  late final int V;
  
  Data.fromJson(Map<String, dynamic> json){
    email = json['email'];
    password = json['password'];
    status = json['status'];
    disableStatus = json['disableStatus'];
    activeStatus = json['activeStatus'];
    ageRestriction = json['ageRestriction'];
    distanceRestriction = json['distanceRestriction'];
    isActive = json['isActive'];
    id = json['_id'];
    createdAt = json['createdAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    _data['status'] = status;
    _data['disableStatus'] = disableStatus;
    _data['activeStatus'] = activeStatus;
    _data['ageRestriction'] = ageRestriction;
    _data['distanceRestriction'] = distanceRestriction;
    _data['isActive'] = isActive;
    _data['_id'] = id;
    _data['createdAt'] = createdAt;
    _data['__v'] = V;
    return _data;
  }
}