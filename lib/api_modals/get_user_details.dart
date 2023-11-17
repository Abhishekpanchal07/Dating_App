class GetUserDetails {
  GetUserDetails({
    required this.success,
    this.data,
  });
  late final bool success;
   List<Data>? data;
  
  GetUserDetails.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = json['data'] == null ? null : List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['success'] = success;
    getdata['data'] = data!.map((e)=>e.toJson()).toList();
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
    required this.location,
    required this.userInterst,
    required this.images,
    required this.filter,
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
  late final List<Location> location;
  late final List<UserInterst> userInterst;
  late final List<Images> images;
  late final List<Filter> filter;
  
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
    location = List.from(json['location']).map((e)=>Location.fromJson(e)).toList();
    userInterst = List.from(json['userInterst']).map((e)=>UserInterst.fromJson(e)).toList();
    images = List.from(json['images']).map((e)=>Images.fromJson(e)).toList();
    filter = List.from(json['filter']).map((e)=>Filter.fromJson(e)).toList();
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
    getdata['location'] = location.map((e)=>e.toJson()).toList();
    getdata['userInterst'] = userInterst.map((e)=>e.toJson()).toList();
    getdata['images'] = images.map((e)=>e.toJson()).toList();
    getdata['filter'] = filter.map((e)=>e.toJson()).toList();
    return getdata;
  }
}

class Location {
  Location({
    required this.id,
    required this.userId,
    required this.longitude,
    required this.latitude,
    required this.status,
    required this.createdAt,
    required this.V,
  });
  late final String id;
  late final String userId;
  late final double longitude;
  late final double latitude;
  late final int status;
  late final String createdAt;
  late final int V;
  
  Location.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    userId = json['userId'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    status = json['status'];
    createdAt = json['createdAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['_id'] = id;
    getdata['userId'] = userId;
    getdata['longitude'] = longitude;
    getdata['latitude'] = latitude;
    getdata['status'] = status;
    getdata['createdAt'] = createdAt;
    getdata['__v'] = V;
    return getdata;
  }
}

class UserInterst {
  UserInterst({
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
  
  UserInterst.fromJson(Map<String, dynamic> json){
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

class Images {
  Images({
    required this.id,
    required this.userId,
    required this.image,
    required this.status,
    required this.V,
  });
  late final String id;
  late final String userId;
  late final List<String> image;
  late final int status;
  late final int V;
  
  Images.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    userId = json['userId'];
    image = List.castFrom<dynamic, String>(json['image']);
    status = json['status'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['_id'] = id;
    getdata['userId'] = userId;
    getdata['image'] = image;
    getdata['status'] = status;
    getdata['__v'] = V;
    return getdata;
  }
}

class Filter {
  Filter({
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
  
  Filter.fromJson(Map<String, dynamic> json){
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