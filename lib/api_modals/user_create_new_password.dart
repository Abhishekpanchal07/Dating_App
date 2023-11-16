class CreateNewPassword {
  CreateNewPassword({
    required this.success,
    required this.message,
  });
  late final bool success;
  late final String message;
  
  CreateNewPassword.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['success'] = success;
    getdata['message'] = message;
    return getdata;
  }
}