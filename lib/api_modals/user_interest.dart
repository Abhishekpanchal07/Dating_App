class UserInterest {
  UserInterest({
    required this.success,
    required this.message,
     this.data,
  });
  late final bool success;
  late final String message;
   List<Data>? data;
  
  UserInterest.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = json['data'] == null ? null : List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
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
    required this.intrestName,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.V,
  });
  late final String userId;
  late final String intrestName;
  late final int status;
  late final String id;
  late final String createdAt;
  late final int V;
  
  Data.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    intrestName = json['intrestName'];
    status = json['status'];
    id = json['_id'];
    createdAt = json['createdAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['userId'] = userId;
    getdata['intrestName'] = intrestName;
    getdata['status'] = status;
    getdata['_id'] = id;
    getdata['createdAt'] = createdAt;
    getdata['__v'] = V;
    return getdata;
  }
}