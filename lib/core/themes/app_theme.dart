import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_textStyles.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: AppColor.blueColor,
    background: AppColor.whiteColor,
    secondary: AppColor.greenColor,
  ),
  primaryColor: AppColor.blueColor,
  textTheme: TextTheme(
    displayLarge: AppStyles.textBlackBold45,
    displaySmall: AppStyles.textWhite14W400,
    displayMedium: AppStyles.textWhite21,
    titleSmall: AppStyles.textBlack40W300,
    headlineMedium: AppStyles.textGery17,
    titleLarge: AppStyles.textWhite60W500,
    titleMedium: AppStyles.textBlack16W500,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    fillColor: const Color(0xff1D1D1D),
    filled: true,
    hintStyle: TextStyle(color: AppColor.whiteColor, fontSize: 21),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.white),
    ),
  ),
);
