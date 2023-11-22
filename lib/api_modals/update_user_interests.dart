class UpdateUserInterest {
  UpdateUserInterest({
    required this.success,
    required this.message,
     this.data,
  });
  late final bool success;
  late final String message;
   List<dynamic>? data;
  
  UpdateUserInterest.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data =json['data'] == null ? null : List.castFrom<dynamic, dynamic>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['success'] = success;
    getdata['message'] = message;
    getdata['data'] = data;
    return getdata;
  }
}