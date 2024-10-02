class DoctorsData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  int? appointPrice;
  String? startTime;
  String? endTime;

  DoctorsData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });
  DoctorsData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    photo = json['photo']?.toString();
    gender = json['gender']?.toString();
    address = json['address']?.toString();
    description = json['description']?.toString();
    degree = json['degree']?.toString();
    appointPrice = json['appoint_price']?.toInt();
    startTime = json['start_time']?.toString();
    endTime = json['end_time']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['photo'] = photo;
    data['gender'] = gender;
    data['address'] = address;
    data['description'] = description;
    data['degree'] = degree;
    data['appoint_price'] = appointPrice;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    return data;
  }
}
