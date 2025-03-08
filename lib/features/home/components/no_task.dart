import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart' show Lottie;

import '../../../core/themes/app_color.dart' show AppColor;
import '../../../core/utils/app_asstes.dart' show AppAsstes;
import '../../../core/utils/app_strings.dart' show MyString;
import '../../../core/utils/size_manager.dart';

class CustomNotask extends StatelessWidget {
  const CustomNotask({super.key, required this.theme});

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          AppAsstes.emptyCheckList,
          width: SizeManager.appSizeWidth(context: context, widthApp: 0.3),
          height: SizeManager.appSizeHeight(context: context, heightApp: 0.3),
        ),
        Text(
          textAlign: TextAlign.center,
          MyString.subtitleEmptyTask,
          style: theme.titleMedium!.copyWith(
            color: AppColor.whiteColor,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
