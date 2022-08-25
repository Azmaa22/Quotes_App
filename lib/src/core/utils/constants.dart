import 'package:clean_architecture_app/src/core/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppConstants {
  static void showErrorToast({
    required String message,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 2,
      backgroundColor: AppColors.kErrorColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
