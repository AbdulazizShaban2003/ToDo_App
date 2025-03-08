import 'package:flutter/material.dart';

class SizeManager {
  static double appSizeWidth({required BuildContext context, required double widthApp}) {
    return MediaQuery.of(context).size.width * widthApp;
  }

  static double appSizeHeight({required BuildContext context, required double heightApp}) {
    return MediaQuery.of(context).size.height * heightApp;
  }
}
