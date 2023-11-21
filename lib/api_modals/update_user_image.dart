class UpdateUserImage {
  UpdateUserImage({
    required this.success,
    this.data,
  });
  late final bool success;
   Data? data;
  
  UpdateUserImage.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = Data.fromJson(json['data']);
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
    required this.image,
    required this.status,
    required this.V,
  });
  late final String id;
  late final String userId;
  late final List<String> image;
  late final int status;
  late final int V;
  
  Data.fromJson(Map<String, dynamic> json){
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