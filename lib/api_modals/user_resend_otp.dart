class ResendOTP {
  ResendOTP({
    required this.success,
    required this.message,
     this.data,
  });
  late final bool success;
  late final String message;
   Data? data;
  
  ResendOTP.fromJson(Map<String, dynamic> json){
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
    required this.email,
    required this.forgotOTP,
  });
  late final String email;
  late final int forgotOTP;
  
  Data.fromJson(Map<String, dynamic> json){
    email = json['email'];
    forgotOTP = json['forgotOTP'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['email'] = email;
    getdata['forgotOTP'] = forgotOTP;
    return getdata;
  }
}