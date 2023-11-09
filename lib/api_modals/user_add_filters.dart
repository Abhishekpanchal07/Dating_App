class AddFilters {
  AddFilters({
    required this.success,
    required this.message,
    this.data,
  });
  late final bool success;
  late final String message;
   Data? data;
  
  AddFilters.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = json['data'] == null ? null :  Data.fromJson(json['data']);
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
    required this.hereTo,
    required this.wantToMeet,
    required this.ageRange,
    required this.language,
    required this.status,
    required this.id,
    required this.V,
  });
  late final String userId;
  late final String hereTo;
  late final String wantToMeet;
  late final String ageRange;
  late final String language;
  late final int status;
  late final String id;
  late final int V;
  
  Data.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    hereTo = json['hereTo'];
    wantToMeet = json['wantToMeet'];
    ageRange = json['ageRange'];
    language = json['language'];
    status = json['status'];
    id = json['_id'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['userId'] = userId;
    getdata['hereTo'] = hereTo;
    getdata['wantToMeet'] = wantToMeet;
    getdata['ageRange'] = ageRange;
    getdata['language'] = language;
    getdata['status'] = status;
    getdata['_id'] = id;
    getdata['__v'] = V;
    return getdata;
  }
}