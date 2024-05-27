class RegisterResponseBody {
  String? message;
  UserData? data;
  bool? status;
  int? code;

  RegisterResponseBody({
    this.message,
    this.data,
    this.status,
    this.code,
  });
  RegisterResponseBody.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    data = (json['data'] != null) ? UserData.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['data'] = this.data!.toJson();
    data['status'] = status;
    data['code'] = code;
    return data;
  }
}

class UserData {
  String? token;
  String? username;

  UserData({
    this.token,
    this.username,
  });
  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token']?.toString();
    username = json['username']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['username'] = username;
    return data;
  }
}
