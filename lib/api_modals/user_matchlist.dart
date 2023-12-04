class UserMatchList {
  UserMatchList({
    required this.success,
     this.data,
    required this.currentUserIntrests,
  });
  late final bool success;
  List<Data>? data;
  late final List<CurrentUserIntrests> currentUserIntrests;
  
  UserMatchList.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    currentUserIntrests = List.from(json['currentUserIntrests']).map((e)=>CurrentUserIntrests.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['success'] = success;
    getdata['data'] = data!.map((e)=>e.toJson()).toList();
    getdata['currentUserIntrests'] = currentUserIntrests.map((e)=>e.toJson()).toList();
    return getdata;
  }
}

class Data {
  Data({
    required this.id,
    required this.userId,
    required this.opponentId,
    required this.matchRequestStatus,
    required this.userDetails,
    required this.fullName,
  });
  late final String id;
  late final String userId;
  late final String opponentId;
  late final int matchRequestStatus;
  late final UserDetails userDetails;
  late final String fullName;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    userId = json['userId'];
    opponentId = json['opponentId'];
    matchRequestStatus = json['matchRequestStatus'];
    userDetails = UserDetails.fromJson(json['userDetails']);
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['_id'] = id;
    getdata['userId'] = userId;
    getdata['opponentId'] = opponentId;
    getdata['matchRequestStatus'] = matchRequestStatus;
    getdata['userDetails'] = userDetails.toJson();
    getdata['fullName'] = fullName;
    return getdata;
  }
}

class UserDetails {
  UserDetails({
    required this.id,
    required this.email,
    required this.ageRestriction,
    required this.isActive,
    required this.about,
    required this.birthDate,
    required this.firstName,
    required this.gender,
    required this.lastName,
    required this.profileImage,
    required this.zodiac,
  });
  late final String id;
  late final String email;
  late final int ageRestriction;
  late final bool isActive;
  late final String about;
  late final String birthDate;
  late final String firstName;
  late final String gender;
  late final String lastName;
  late final String profileImage;
  late final String zodiac;
  
  UserDetails.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    email = json['email'];
    ageRestriction = json['ageRestriction'];
    isActive = json['isActive'];
    about = json['about'];
    birthDate = json['birthDate'];
    firstName = json['firstName'];
    gender = json['gender'];
    lastName = json['lastName'];
    profileImage = json['profileImage'];
    zodiac = json['zodiac'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['_id'] = id;
    getdata['email'] = email;
    getdata['ageRestriction'] = ageRestriction;
    getdata['isActive'] = isActive;
    getdata['about'] = about;
    getdata['birthDate'] = birthDate;
    getdata['firstName'] = firstName;
    getdata['gender'] = gender;
    getdata['lastName'] = lastName;
    getdata['profileImage'] = profileImage;
    getdata['zodiac'] = zodiac;
    return getdata;
  }
}

class CurrentUserIntrests {
  CurrentUserIntrests({
    required this.id,
    required this.userId,
    required this.intrestName,
    required this.status,
    required this.createdAt,
    required this.V,
  });
  late final String id;
  late final String userId;
  late final String intrestName;
  late final int status;
  late final String createdAt;
  late final int V;
  
  CurrentUserIntrests.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    userId = json['userId'];
    intrestName = json['intrestName'];
    status = json['status'];
    createdAt = json['createdAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['_id'] = id;
    getdata['userId'] = userId;
    getdata['intrestName'] = intrestName;
    getdata['status'] = status;
    getdata['createdAt'] = createdAt;
    getdata['__v'] = V;
    return getdata;
  }
}