class Validations {
  static String validateOTP(String value) {
    if (value.isEmpty) return 'OTP is required.';
    if (value.length != 6) return 'OTP has to be 6 digits';
    return null;
  }

  static String validateNotEmpty(String value) {
    if (value.trim().isEmpty) return "This value cannot be empty.";
    return null;
  }

  //Validate PAN Number
  static String validatePanNumber(String value) {
    if (value.isEmpty) return 'PAN number is required.';
    final RegExp nameExp =
        new RegExp(r'^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$');
    if (!nameExp.hasMatch(value)) return 'PAN Number is invalid.';
    return null;
  }
}
