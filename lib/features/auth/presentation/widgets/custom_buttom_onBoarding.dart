
import 'package:flutter/material.dart';

import '../../../../core/themes/app_color.dart' show AppColor;
import '../../../../core/utils/app_strings.dart' show MyString;

class CustomButtomOnBoarding extends StatelessWidget {
  const CustomButtomOnBoarding({
    super.key,
    required this.index,
    required this.controller,
  });

  final int index;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          index > 0
              ? BackButton(controller: controller)
              : Container(),
          Spacer(),
          index == 2
              ? ElevatedButton(
            onPressed: () {
              controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryLightColor,
            ),
            child: Text(
              MyString.getStarted,
              style: TextStyle(
                fontSize: 20,
                color: AppColor.whiteColor,
              ),
            ),
          )
              : ElevatedButton(
            onPressed: () {
              controller.nextPage(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOutCubicEmphasized,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryLightColor,
            ),
            child: Text(
              MyString.next,
              style: TextStyle(
                fontSize: 20,
                color: AppColor.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        controller.previousPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
        );
      },
      child: Text(
        MyString.back,
        style: TextStyle(color: AppColor.GreyColor, fontSize: 25),
      ),
    );
  }
}
