import 'package:basic_utils/basic_utils.dart';
import 'package:inspection/inspection.dart';

class FormValidator {
  static String? valueString(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Empty';
    }
    return null;
  }

  static String? validateName(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Invalid name';
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is Empty ';
    }
    if (!EmailUtils.isEmail(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePhone(String value, {String? name}) {
    return Inspection().inspect(
      value,
      'required|numeric|min:3|max:16',
      name: name,
    );
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is Empty";
    }

    if (value.trim().isEmpty || value.length < 6) {
      return 'Password must be more than 6 character';
    }
    return null;
  }

  static String? validateAccountNumber(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Invalid Account Number';
    }
    return null;
  }

  static String? validateAmount(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return 'Invalid Amount';
    }
    if (int.parse(value) == 0) {
      return 'Amount Should be greater than 0';
    }
    return null;
  }
}
