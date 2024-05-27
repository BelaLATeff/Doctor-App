class RegisterRequestBody {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String password;
  final String passwordConfirm;
  RegisterRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
    required this.passwordConfirm,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["name"] = name;
    data["email"] = email;
    data["phone"] = phone;
    data["gender"] = gender;
    data["password"] = password;
    data["password_confirmation"] = passwordConfirm;

    return data;
  }

  toLowerCase() {}
}
