class GetUserLocation {
  GetUserLocation({
    required this.success,
    required this.message,
     this.data,
  });
  late final bool success;
  late final String message;
  Data? data;
  
  GetUserLocation.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = json['data'] == null ? null : Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['success'] = success;
    getdata['message'] = message;
    getdata['data'] = data!.toJson();
    return getdata;
  }
}

class Data {
  Data({
    required this.userId,
    required this.longitude,
    required this.latitude,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.V,
  });
  late final String userId;
  late final double longitude;
  late final double latitude;
  late final int status;
  late final String id;
  late final String createdAt;
  late final int V;
  
  Data.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    status = json['status'];
    id = json['_id'];
    createdAt = json['createdAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['userId'] = userId;
    getdata['longitude'] = longitude;
    getdata['latitude'] = latitude;
    getdata['status'] = status;
    getdata['_id'] = id;
    getdata['createdAt'] = createdAt;
    getdata['__v'] = V;
    return getdata;
  }
}