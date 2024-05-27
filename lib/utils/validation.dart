class Validation {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is Required";
    }
    if (!value.contains("@")) {
      return "Please Enter valid Email";
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is Required";
    }
    if (value.length < 8) {
      return "Must be at least 8 character";
    }
    return null;
  }
}
