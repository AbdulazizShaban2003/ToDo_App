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
);
