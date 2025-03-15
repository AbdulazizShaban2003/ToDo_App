import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import Fluttertoast package
import '../utils/app_colors.dart';

/// Function to navigate to a new screen
void navigate({required BuildContext context, required Widget screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
}

/// Function to show a toast message
void showToast({
  required String message,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: getStateColor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

/// Enum representing different toast states
enum ToastStates { error, success, warning }

/// Function to get the corresponding color for each toast state
Color getStateColor(ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return AppColors.red;
    case ToastStates.success:
      return AppColors.primary;
    case ToastStates.warning:
      return AppColors.orange;
  }
}
