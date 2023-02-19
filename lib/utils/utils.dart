import 'package:flutter/material.dart';

class Utils {
  // function to change the focus from the current textfield to another with keyboard
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
