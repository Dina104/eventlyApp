class Validator {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Plz enter name";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    var regEx = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
      r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?"
      r"(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    );
    if (value == null || value.trim().isEmpty) {
      return "Plz enter email";
    }
    if (!regEx.hasMatch(value)) {
      return "Email bad format";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    var regEx = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (value == null || value.trim().isEmpty) {
      return "Plz enter password";
    }
    if (!regEx.hasMatch(value)) {
      return "Weak password";
    }
    return null;
  }
  static String? validateRePassword(String? repassword,) {
    if (repassword == null || repassword.trim().isEmpty) {
      return "Plz enter Repassword";
    }
   // if(repassword!=password){
     // return "password not match";

    //}
    return null;
  }

}
