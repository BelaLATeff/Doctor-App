class LoginRequestBody {
  final String email;
  final String password;

  LoginRequestBody({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;

    return data;
  }

  toLowerCase() {}
}
