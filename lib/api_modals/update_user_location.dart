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
     this.id,
     this.userId,
     this.longitude,
     this.latitude,
     this.distanceRange,
     this.status,
     this.createdAt,
     this.V,
  });
   String? id;
   String? userId;
   double? longitude;
   double? latitude;
   int? distanceRange;
   int? status;
   String? createdAt;
   int? V;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    userId = json['userId'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    distanceRange = json['distanceRange'] ;
    status = json['status'] ;
    createdAt = json['createdAt'] ;
    V = json['__v'] ;
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['_id'] = id;
    getdata['userId'] = userId;
    getdata['longitude'] = longitude;
    getdata['latitude'] = latitude;
    getdata['distanceRange'] = distanceRange;
    getdata['status'] = status;
    getdata['createdAt'] = createdAt;
    getdata['__v'] = V;
    return getdata;
  }
}