class UpdateUserSingleImage {
  UpdateUserSingleImage({
    required this.image,
  });
  late final String image;
  
  UpdateUserSingleImage.fromJson(Map<String, dynamic> json){
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final getdata = <String, dynamic>{};
    getdata['image'] = image;
    return getdata;
  }
}