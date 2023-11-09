class AddPhotos {
  AddPhotos({
    required this.success,
    required this.message,
     this.data,
  });
  late final bool success;
  late final String message;
   List<Data>? data;
  
  AddPhotos.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data =  json['data']== null ? null : List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['success'] = success;
    getdata['message'] = message;
    getdata['data'] = data!.map((e)=>e.toJson()).toList();
    return getdata;
  }
}

class Data {
  Data({
    required this.userId,
    required this.image,
    required this.status,
    required this.id,
    required this.V,
  });
  late final String userId;
  late final List<String> image;
  late final int status;
  late final String id;
  late final int V;
  
  Data.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    image = List.castFrom<dynamic, String>(json['image']);
    status = json['status'];
    id = json['_id'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['userId'] = userId;
    getdata['image'] = image;
    getdata['status'] = status;
    getdata['_id'] = id;
    getdata['__v'] = V;
    return getdata;
  }
}