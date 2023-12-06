class UpdateUserLocation {
  UpdateUserLocation({
    required this.success,
     this.data,
  });
  late final bool success;
   Data? data;
  
  UpdateUserLocation.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = json['data'] == null ? null : Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['success'] = success;
    getdata['data'] = data!.toJson();
    return getdata;
  }
}

class Data {
  Data({
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
  
  Data.fromJson(Map<String, dynamic> json){
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