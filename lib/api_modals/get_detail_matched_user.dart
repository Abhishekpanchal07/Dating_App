class GetSingleMatchedUserDetail {
  GetSingleMatchedUserDetail({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;
  
  GetSingleMatchedUserDetail.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['success'] = success;
    getdata['data'] = data.map((e)=>e.toJson()).toList();
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
    required this.about,
    required this.birthDate,
    required this.firstName,
    required this.gender,
    required this.lastName,
    required this.profileImage,
    required this.zodiac,
    required this.image,
    required this.userLocation,
    required this.userFilters,
    required this.userIntrests,
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
  late final String about;
  late final String birthDate;
  late final String firstName;
  late final String gender;
  late final String lastName;
  late final String profileImage;
  late final String zodiac;
  late final List<Image> image;
  late final List<UserLocation> userLocation;
  late final List<UserFilters> userFilters;
  late final List<UserIntrests> userIntrests;
  
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
    about = json['about'];
    birthDate = json['birthDate'];
    firstName = json['firstName'];
    gender = json['gender'];
    lastName = json['lastName'];
    profileImage = json['profileImage'];
    zodiac = json['zodiac'];
    image = List.from(json['image']).map((e)=>Image.fromJson(e)).toList();
    userLocation = List.from(json['userLocation']).map((e)=>UserLocation.fromJson(e)).toList();
    userFilters = List.from(json['userFilters']).map((e)=>UserFilters.fromJson(e)).toList();
    userIntrests = List.from(json['userIntrests']).map((e)=>UserIntrests.fromJson(e)).toList();
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
    getdata['about'] = about;
    getdata['birthDate'] = birthDate;
    getdata['firstName'] = firstName;
    getdata['gender'] = gender;
    getdata['lastName'] = lastName;
    getdata['profileImage'] = profileImage;
    getdata['zodiac'] = zodiac;
    getdata['image'] = image.map((e)=>e.toJson()).toList();
    getdata['userLocation'] = userLocation.map((e)=>e.toJson()).toList();
    getdata['userFilters'] = userFilters.map((e)=>e.toJson()).toList();
    getdata['userIntrests'] = userIntrests.map((e)=>e.toJson()).toList();
    return getdata;
  }
}

class Image {
  Image({
    required this.id,
    required this.image,
  });
  late final String id;
  late final List<String> image;
  
  Image.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    image = List.castFrom<dynamic, String>(json['image']);
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['_id'] = id;
    getdata['image'] = image;
    return getdata;
  }
}

class UserLocation {
  UserLocation({
    required this.id,
    required this.longitude,
    required this.latitude,
  });
  late final String id;
  late final double longitude;
  late final double latitude;
  
  UserLocation.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['_id'] = id;
    getdata['longitude'] = longitude;
    getdata['latitude'] = latitude;
    return getdata;
  }
}

class UserFilters {
  UserFilters({
    required this.id,
    required this.userId,
    required this.hereTo,
    required this.wantToMeet,
    required this.ageRange,
    required this.language,
    required this.status,
    required this.V,
  });
  late final String id;
  late final String userId;
  late final String hereTo;
  late final String wantToMeet;
  late final String ageRange;
  late final String language;
  late final int status;
  late final int V;
  
  UserFilters.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    userId = json['userId'];
    hereTo = json['hereTo'];
    wantToMeet = json['wantToMeet'];
    ageRange = json['ageRange'];
    language = json['language'];
    status = json['status'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['_id'] = id;
    getdata['userId'] = userId;
    getdata['hereTo'] = hereTo;
    getdata['wantToMeet'] = wantToMeet;
    getdata['ageRange'] = ageRange;
    getdata['language'] = language;
    getdata['status'] = status;
    getdata['__v'] = V;
    return getdata;
  }
}

class UserIntrests {
  UserIntrests({
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
  
  UserIntrests.fromJson(Map<String, dynamic> json){
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