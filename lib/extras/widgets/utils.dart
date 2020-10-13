import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rgproject/extras/colors.dart';

class MyUtils {
  static String isEmailStr(String email, {String error = "Field is required"}) {
    return isEmail(email) ? null : error;
  }
  static bool isEmail(String email) {
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(email);
  }
  static String getFormattedAmount(num amount) {
    return '${new NumberFormat('#,##0.0', 'en_GB').format(amount)}';
  }

  static bool isNum(String num) {
    String a = "(?:[+0])" + "[0-9]";

    RegExp regExp = RegExp(a);
    return regExp.hasMatch(num);
  }

  static void showFlushBar(BuildContext context, String message) {
    Flushbar(
      messageText: Text(
        message,
        style: TextStyle(color: Colors.black87),
      ),
      borderColor: MyColors.defaultPurple,
      backgroundColor: Colors.white70,
      duration: Duration(seconds: 3),
    )..show(context);
  }
}


