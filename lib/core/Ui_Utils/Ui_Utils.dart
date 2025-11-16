import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UIUtils {
  static void showLoading(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context, builder: (context) =>
        PopScope(
          canPop: false,
          child: AlertDialog(content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: CircularProgressIndicator(),),
            ],
          ),),
        ));
  }


  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }


  static void showtoastMessage(String message, Color bgColor) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}