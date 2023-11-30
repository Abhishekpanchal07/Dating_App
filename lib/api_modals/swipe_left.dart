class SwipeLeft {
  SwipeLeft({
    required this.success,
    required this.message,
    this.data,
  });
  late final bool success;
   String? message;
  Data? data;
  
  SwipeLeft.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'] ;
    data = Data.fromJson(json['data']);
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
    required this.opponentId,
    required this.matchRequestStatus,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.V,
  });
  late final String userId;
  late final String opponentId;
  late final int matchRequestStatus;
  late final int status;
  late final String id;
  late final String createdAt;
  late final int V;
  
  Data.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    opponentId = json['opponentId'];
    matchRequestStatus = json['matchRequestStatus'];
    status = json['status'];
    id = json['_id'];
    createdAt = json['createdAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['userId'] = userId;
    getdata['opponentId'] = opponentId;
    getdata['matchRequestStatus'] = matchRequestStatus;
    getdata['status'] = status;
    getdata['_id'] = id;
    getdata['createdAt'] = createdAt;
    getdata['__v'] = V;
    return getdata;
  }
}