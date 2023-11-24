class UpdateUserProfile {
  UpdateUserProfile({
    required this.success,
     this.data,
    required this.image,
    required this.filter,
  });
  late final bool success;
  Data? data;
  late final Image image;
  late final Filter filter;
  
  UpdateUserProfile.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = json['data'] == null ? null : Data.fromJson(json['data']);
    image = Image.fromJson(json['image']);
    filter = Filter.fromJson(json['filter']);
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['success'] = success;
    getdata['data'] = data!.toJson();
    getdata['image'] = image.toJson();
    getdata['filter'] = filter.toJson();
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
    about = json['about'] ?? "";
    birthDate = json['birthDate'] ?? "";
    firstName = json['firstName'] ?? "";
    gender = json['gender'] ?? "";
    lastName = json['lastName'] ?? "";
    profileImage = json['profileImage'] ?? "";
    zodiac = json['zodiac'] ?? "";
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
    return getdata;
  }
}

class Image {
  Image({
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
  
  Image.fromJson(Map<String, dynamic> json){
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